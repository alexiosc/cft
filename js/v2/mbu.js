// -*- javascript -*-

MBU = {
    code: 'MBU',
    name: 'Memory Banking Unit',

    hard: true,
    soft: null,			// Initialised below

    init: function()
    {
	var i;
	var a = [];
	for (i = 0; i < 8; i++) a[i] = (rand() & 0xff) << 13;
	MBU.soft = _Uint32Array(a);
    },

    reset: function()
    {
	MBU.setMapping(1);
    },

    setMapping: function(isHard)
    {
	if (isHard === MBU.hard) return;
	MBU.hard = isHard;

	// Monkey-patch the Bus
	if (isHard) {
	    console.debug("MBU: disabled");
	    Bus.mr = MBU.hard_mr;
	    Bus.mw = MBU.hard_mw;
	} else {
	    console.debug("MBU: enabled");
	    Bus.mr = MBU.soft_mr;
	    Bus.mw = MBU.soft_mw;
	}
    },

    hard_mr: function(addr)
    {
	var data = 0x53ef;
	if (addr & 0x8000) {
	    // Reading from ROM
	    data = Bus._rom[addr & 0x7fff];
	    // console.log('Read ROM: mem[' + addr.toString(16) + '] -> ' + data.toString(16))
	    // CFT.debug('Read ROM: mem[' + addr.toString(16) + '] -> ' + data.toString(16));
	} else {
	    // Reading from RAM
	    data = Bus._ram[addr & 0x7fff];
	    //CFT.debug('Read RAM: mem[' + addr.toString(16) + '] -> ' + data.toString(16));
	}
	return data & 0xffff;
    },
    
    hard_mw: function(addr, data)
    {
	if (addr & 0x8000) {
	    // Attemping to write to ROM
	    CFT.fail('Attempt to write ROM: mem[' + addr.toString(16) + '] <- ' + data.toString(16));
	} else {
	    // Writing to RAM
	    Bus._ram[addr] = data & 0xffff;
	    //CFT.debug('Write: mem[' + addr.toString(16) + '] <- ' + data.toString(16));
	}
    },

    physAddr: function(addr)
    {
	// MBU.soft already contains base addresses (value << 13)
	return MBU.soft[(addr >> 13) & 0x7] | (addr & 0x1fff);
    },

    soft_mr: function(addr)
    {
	var aext = MBU.physAddr(addr);
	switch((aext >> 19) & 3) {
	case 0:
	    return Bus._ram[aext & 0x7ffff];
	case 2:
	    return Bus._rom[aext & 0x7ffff];
	default:
	    if (CFT.hob) {
		CFT.fail('Attempt to write to non-existent physical memory: [' + hex(aext,6) + '] <- ' + hex(data,4));
	    }
	    return 0x0000;
	}
    },

    soft_mw: function(addr, data)
    {
	var aext = MBU.physAddr(addr);
	switch((aext >> 19) & 3) {
	case 0:
	    Bus._ram[aext & 0x7ffff] = data & 0xffff;
	    return;
	case 2:
	    if (CFT.hob) {
		CFT.fail('Attempt to write to ROM: [' + hex(aext,6) + '] <- ' + hex(data, 4));
	    }
	    return;
	default:
	    if (CFT.hob) {
		CFT.fail('Attempt to write to non-existent physical memory: [' + hex(aext,6) + '] <- ' + hex(data,4));
	    }
	    return;
	}
    },

    ior: function(addr)
    {
	return -1;
    },
    
    iow: function(addr, data)
    {
	if (addr >= 0x20 && addr < 0x28) {
	    MBU.soft[addr - 0x20] = (data & 0xff) << 13;
	    //console.log(MBU.soft);
	    // for (var i = 0; i < 8; i++) {
	    // 	console.log("Bank #" + i + ": PA " + hex(MBU.soft[i], 6) + "-" 
	    // 		    + hex(MBU.soft[i] | 0x1fff, 6));
	    // }
	    if (addr == 0x20) {
		// Bit 8 of port 0x20 controls the mapping
		if (data & 0x100) MBU.setMaping(1); // Hard mapping (disable MBU)
		else MBU.setMapping(0);		    // Soft mapping (enable MBU)
	    }
	    DFP.activity(DFP.ACT_LIGHT_MBU);
	    return 0;
	}
	return -1;
    }

}

// End of file.
