// -* javascript -*-

IRC = {
    code: 'IRC',
    name: 'Interrupt Controller',
    
    ifr: 0,			// Interrupt Flag Register
    ier: 0,			// Interrupt Enable Register

    init: function()
    {
	IRC.ifr = 0;
	IRC.irf = 0;
    },

    reset: function()
    {
	IRC.irf = 0;
	IRC.ier = 0;
    },

    ior: function(addr)
    {
	if (addr == 0x28) {
	    DFP.activity(DFP.ACT_LIGHT_IRC);
	    return 0x0f00 | (IRC.irf & 0xff);
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
		// Set an IRQ 
		IRC.ier |= (1 << irqn);
	    } else {
		// Clear an IRQ
		IRC.ier &= ~(1 << irqn);
	    }

	    // Mask interrupts. This clears interrupt flags for masked
	    // interrupts, so masking an interrupt also works as an
	    // interrupt acknowledge signal.
	    IRC.irf &= IRC.ier;

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

	for (var i = 0; i < 8; i++) {
	    if (IRC.irf[i]) {
		CFT.signalInterrupt();
		return;
	    }
	}
    },

    irq: function(n)
    {
	if ((n < 0) || (n > 7)) {
	    CFT.fail('Attempted to signal invalid IRQ ' + n);
	    return;
	}

	IRC.irf |= (IRC.ier & (1 << n));
    }
};

// End of file.