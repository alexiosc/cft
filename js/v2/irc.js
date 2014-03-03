// -*- javascript -*-

IRC = {
    code: 'IRC',
    name: 'Interrupt Controller',
    
    isr: 0,			// Interrupt Status Register
    icr: 0,			// Interrupt Control Register

    init: function()
    {
	IRC.icr = 0;
	IRC.isr = 0;
    },

    reset: function()
    {
	IRC.icr = 0;
	IRC.isr = 0;
    },

    ior: function(addr)
    {
	if (addr == 0x28) {
	    DFP.activity(DFP.ACT_LIGHT_IRC);
	    return 0x0f00 | (IRC.isr & 0xff);
	}
	return -1;
    },
    
    iow: function(addr, data)
    {
	if (addr == 0x28) {
	    // The IRQ number is in bits 1-3
	    var irqn = (data >> 1) & 7;

	    // The set/clear command is bit 0
	    if (data & 1) {
		//console.log('enable irq', irqn);
		// Set an IRQ 
		IRC.icr |= (1 << irqn);
	    } else {
		//console.log('disable irq', irqn);
		// Clear an IRQ
		IRC.icr &= ~(1 << irqn);
	    }

	    // Mask interrupts. This clears interrupt flags for masked
	    // interrupts, so masking an interrupt also works as an
	    // interrupt acknowledge signal.
	    IRC.isr &= IRC.icr;

	    DFP.activity(DFP.ACT_LIGHT_IRC);
	    return 1;
	}
	return -1;
    },

    tick: function()
    {
	// CFT interrupts are level-sensitive, which means that until
	// the source of an interrupt is cleared, we'll keep
	// signaling.

	for (var i = 1; i < 256; i = i << 1) {
	    if (IRC.isr & i) {
		CFT.signalInterrupt();
		return;
	    }
	}
    },

    irq: function(n)
    {
	//console.log('irq', n);
	if ((n < 0) || (n > 7)) {
	    CFT.fail('Attempted to signal invalid IRQ ' + n);
	    return;
	}

	IRC.isr |= (IRC.icr & (1 << n));
	console.log(bin(IRC.icr, 8), bin(IRC.isr, 8));
    }
};

// End of file.