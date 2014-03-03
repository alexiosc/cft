// -*- javascript -*-

CFT = {
    
    // Constants
    RESET_VECTOR: 0xfff0,
    INT_VECTOR:   0xfff8,

    instrTable: [],
    
    // Register file (only necessary registers)
    r: {
	ir:0,                   // IR: Instruction register
	pc:0,			// PC: Program counter
	ac:0,			// AC: Accumulator
	ucb:0, 			// Current uCB: Microcode bank (0-15)
	ucbPerm:0,		// Sticky uCB register
	l:0,                    // Link register
	v:0,                    // Overflow flag
	i:0,			// Interrupt flag: (boolean, 0 = int masked)
	irq:0			// Interrupt has been signaled
    },

    rsthold: 0,
    hob: 1,			// If true, fail() causes a halt
    halted: 0,
    failed: 0,
    debugging: false,
    trace: false,

    ///////////////////////////////////////////////////////////////////////////////
    //
    // Methods
    //
    ///////////////////////////////////////////////////////////////////////////////

    error: function(msg)
    {
	console.error('CFT: ' + msg);
    },
    
    debug: function(msg)
    {
	if (CFT.debugging) console.log(msg);
    },

    fail: function(msg)
    {
	if (console) console.error('CFT:' + msg);
	CFT.failed = 1;
	if (CFT.hob) {
	    CFT.halted = 1;
	    DFP.console('%+r *** Failed: ' + msg + ' *** %-r\n');
	}
	DFP.updateLights();
    },

    init: function()
    {
	CFT.initMicrocode(6);
	return CFT;
    },

    instrDebug: function(msg)
    {
	if (CFT.trace) console.log('CFT:' + msg);
    },

    // Initialise
    initMicrocode: function(version)
    {
	if (version !== 6) {
	    CFT.fail("Only version 6 microcode implemented.");
	    return;
	}

	_baseInstr = [
	    CFT.TRAP,   CFT.TRAPI,
	    CFT.IOT,    CFT.IOTI,
	    CFT.LOAD,   CFT.LOADI,
	    CFT.STORE,  CFT.STOREI,
	    CFT.IN,     CFT.INI,
	    CFT.OUT,    CFT.OUTI,
	    CFT.JMP,    CFT.JMPI,
	    CFT.JSR,    CFT.JSRI,
	    CFT.ADD,    CFT.ADDI,
	    CFT.AND,    CFT.ANDI,
	    CFT.OR,     CFT.ORI,
	    CFT.XOR,    CFT.XORI,
	    CFT.OP1,    CFT.NOP,
	    CFT.OP2,    CFT.POP,
	    CFT.ISZ,    CFT.ISZI,
	    CFT.LIA,    CFT.JMPII
	];

	for (var i = 0; i < 16; i++) {
	    CFT.instrTable = CFT.instrTable.concat(_baseInstr);
	}
	return CFT;
    },

    // Resetting the processor
    reset: function()
    {
	CFT.r.pc = CFT.RESET_VECTOR; // Jump to reset address
	CFT.r.i = 0;		     // Mask interrupts
	CFT.r.irq = 0;		     // Clear any pending interrupts
	CFT.failed = 0;		     // Clear the failed flag
	CFT.rsthold = 1000000;
	DFP.updateLights();
	return CFT;
    },
    
    halt: function()
    {
	CFT.halted = 1;
	DFP.updateLights();
	return CFT;
    },

    start: function()
    {
	CFT.halted = 0;
	DFP.updateLights();
	return CFT;
    },

    tick: function()
    {
	// Resetting?
	if (CFT.rsthold > 0) {
	    CFT.rsthold--;
	    return CFT;
	}
	
	// Are we halted?
	if (CFT.halted) return CFT;

	// Do we have an interrupt?
	if (CFT.r.irq) {
	    Bus.mw(2, CFT.r.pc);       // mem[2] = PC
	    CFT.r.pc = CFT.INT_VECTOR; // Jump to interrupt address
	    CFT.r.i = 0;	       // Mask interrupts
	    CFT.r.irq = 0;	       // Clear any pending interrupts
	    return CFT;
	}
	
	// Fetch
	CFT.r.ir = Bus.mr(CFT.r.pc) & 0xffff;
	CFT.r.pc = (CFT.r.pc + 1) & 0xffff;

	// Execute
	var i = (CFT.r.ucb << 5) || ((CFT.r.ir & 0xf800) >> 11);
	CFT.r.ucb = CFT.r.ucbPerm; // Reset transient uCB.
	CFT.instrTable[i]();
	CFT.debug('PC: 0x' + CFT.r.pc.toString(16) +
		  ' IR: ' + CFT.r.ir.toString(16) +
		  ' AC: ' + CFT.r.ac.toString(16));

	return CFT;
    },

    // Address Generation Logic. Generate local or page 0 addresses (if R=1).
    AGL: function(op) {
	return ((CFT.r.ir & 0x400 ? 0 : CFT.r.pc) & 0xfc00) | (CFT.r.ir & 0x3ff);
    },

    // If the address is between 0x0080 and 0x00ff, autoincrement it.
    maybeAutoIncrement: function(a, dr)
    {
	if ((a & 0xff80) == 0x80) Bus.mw(a, dr + 1);
    },

    // Signal an interrupt
    signalInterrupt: function()
    {
	if (CFT.r.i == 1) CFT.r.irq = 1;
    },

    ///////////////////////////////////////////////////////////////////////////////
    //
    // Instructions
    //
    ///////////////////////////////////////////////////////////////////////////////
    
    // TRAP instruction
    TRAP: function(){
	CFT.instrDebug("TRAP");
	Bus.mw(1, CFT.r.pc);	               // mem[1] = PC
	CFT.r.pc = CFT.AGL();		       // PC = AGL
    },
    
    TRAPI: function(){
	CFT.instrDebug("TRAP I");
	Bus.mw(1, CFT.r.pc);	               // mem[1] = PC
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	CFT.r.pc = dr;		               // PC = mem[AGL]
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },
 
    // IOT instruction
    IOT: function(){
	CFT.instrDebug("IOT");
	var ar = CFT.AGL();
	Bus.iow(ar, CFT.r.ac);	               // io[AGL] = AC
	CFT.r.ac = Bus.ior(ar);		       // AC = io[AGL]
    },
    
    IOTI: function(){
	CFT.instrDebug("IOT I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	Bus.iow(dr, CFT.r.ac);	               // io[mem[AGL]] = AC
	CFT.r.ac = Bus.ior(dr);		       // AC = io[mem[AGL]]
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // LOAD instruction
    LOAD: function(){
	CFT.instrDebug("LOAD");
	CFT.r.ac = Bus.mr(CFT.AGL());          // AC = mem[AGL]
    },
    
    LOADI: function(){
	CFT.instrDebug("LOAD I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	CFT.r.ac = Bus.mr(dr);		       // AC = mem[mem[AGL]]
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // STORE instruction
    STORE: function(){
	CFT.instrDebug("STORE");
	Bus.mw(CFT.AGL(), CFT.r.ac);           // mem[AGL] = AC
    },
    
    STOREI: function(){
	CFT.instrDebug("STORE I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	Bus.mw(dr, CFT.r.ac);		       // mem[mem[AGL]] = AC
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // IN instruction
    IN: function(){
	CFT.instrDebug("IN");
	CFT.r.ac = Bus.ior(CFT.AGL());          // AC = io[AGL]
    },
    
    INI: function(){
	CFT.instrDebug("IN I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	CFT.r.ac = Bus.ior(dr);		       // AC = io[mem[AGL]]
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // OUT instruction
    OUT: function(){
	CFT.instrDebug("OUT");
	Bus.iow(CFT.AGL(), CFT.r.ac);           // io[AGL] = AC
    },
    
    OUTI: function(){
	CFT.instrDebug("OUT I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	Bus.iow(dr, CFT.r.ac);		       // io[mem[AGL]] = AC
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // JMP instructions
    JMP: function(){
	CFT.instrDebug("JMP");
	CFT.r.pc = CFT.AGL();	               // PC = AGL
    },
    
    JMPI: function(){
	CFT.instrDebug("JMP I");
	var ar = CFT.AGL();
	CFT.r.pc = Bus.mr(ar);		       // AC = mem[mem[AGL]]
	CFT.maybeAutoIncrement(ar, CFT.r.pc);  // Autoincrement step
    },

    JMPII: function(){
	CFT.instrDebug("JMPII");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // First indirection step
	CFT.r.pc = Bus.mr(dr);		       // PC = mem[mem[DR]] (2nd indirection)
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // JSR instruction
    JSR: function(){
	CFT.instrDebug("JSR");
	Bus.mw(0, CFT.r.pc);	               // mem[0] = PC
	CFT.r.pc = CFT.AGL(CFT.r.ir);          // PC = AGL
    },
    
    JSRI: function(){
	CFT.instrDebug("JSR I");
	Bus.mw(0, CFT.r.pc);	               // mem[0] = PC
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	CFT.r.pc = dr;		               // PC = mem[AGL]
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // ADD instruction
    ADD: function(){
	CFT.instrDebug("ADD");
	var x = Bus.mr(CFT.AGL());
	var n1 = CFT.r.ac & 0x8000;
	var n2 = x & 0x8000;

	CFT.r.ac += x;			       // AC += mem[AGL]
	if (CFT.r.ac & 0x10000) CFT.r.l ^= 1;  // Update L
	CFT.r.ac &= 0xffff;		       // Addition

	CFT.r.v = (n1 == n2) && (n1 != (CFT.r.ac & 0x8000)); // Overflow detection
    },
    
    ADDI: function(){
	CFT.instrDebug("ADD I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step

	var x = Bus.mr(dr);
	var n1 = CFT.r.ac & 0x8000;
	var n2 = x & 0x8000;

	CFT.r.ac += x;			       // AC += mem[mem[AGL]]
	if (CFT.r.ac & 0x10000) CFT.r.l ^= 1;  // Update L
	CFT.r.ac &= 0xffff;		       // Addition
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step

	CFT.r.v = (n1 == n2) && (n1 != (CFT.r.ac & 0x8000)); // Overflow detection
    },

    // AND instruction
    AND: function(){
	CFT.instrDebug("AND");
	CFT.r.ac &= Bus.mr(CFT.AGL());         // AC &= mem[AGL]
	CFT.r.l = (CFT.r.ac & 0x10000) != 0;   // Update L
	CFT.r.ac &= 0xffff;		       // Addition
    },
    
    ANDI: function(){
	CFT.instrDebug("AND I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	CFT.r.ac &= Bus.mr(dr);		       // AC &= mem[mem[AGL]]
	CFT.r.l = (CFT.r.ac & 0x10000) != 0;   // Update L
	CFT.r.ac &= 0xffff;		       // Addition
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // OR instruction
    OR: function(){
	CFT.instrDebug("OR");
	CFT.r.ac |= Bus.mr(CFT.AGL());         // AC |= mem[AGL]
	CFT.r.l = (CFT.r.ac & 0x10000) != 0;   // Update L
	CFT.r.ac &= 0xffff;		       // Addition
    },
    
    ORI: function(){
	CFT.instrDebug("OR I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	CFT.r.ac |= Bus.mr(dr);		       // AC |= mem[mem[AGL]]
	CFT.r.l = (CFT.r.ac & 0x10000) != 0;   // Update L
	CFT.r.ac &= 0xffff;		       // Addition
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // XOR instruction
    XOR: function(){
	CFT.instrDebug("XOR");
	CFT.r.ac ^= Bus.mr(CFT.AGL());         // AC ^= mem[AGL]
	CFT.r.l = (CFT.r.ac & 0x10000) != 0;   // Update L
	CFT.r.ac &= 0xffff;		       // Addition
    },
    
    XORI: function(){
	CFT.instrDebug("XOR I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	               // Indirection step
	CFT.r.ac ^= Bus.mr(dr);		       // AC ^= mem[mem[AGL]]
	CFT.r.l = (CFT.r.ac & 0x10000) != 0;   // Update L
	CFT.r.ac &= 0xffff;		       // Addition
	CFT.maybeAutoIncrement(ar, dr);	       // Autoincrement step
    },

    // OP1 instruction
    OP1: function(){
	CFT.instrDebug("OP1");
	var b = CFT.r.ir & 0x3ff;

	// Minor operations
	if ((b & 0x200) && CFT.r.l == 0) return; // IFL?
	if ((b & 0x100) && CFT.r.v == 0) return; // IFV?
	if (b & 0x80) CFT.r.ac = 0;		 // AC = 0
	if (b & 0x40) CFT.r.l = 0;		 // L = 0
	if (b & 0x20) CFT.r.ac ^= 0xffff;	 // Complement AC
	if (b & 0x10)
	    if (++CFT.r.ac == 0) CFT.r.l ^= 1;   // <L,AC>++
	if (b & 0x8) CFT.r.l ^= 1;		 // Toggle L
	
	// Rolls
	var val = ((CFT.r.l << 16) | CFT.r.ac) & 0x1ffff;
	switch (b & 7) {
	    case 1:			/* roll bit right */
		val = ((val >> 1) & 0x0ffff) | ((val & 0x00001) << 16);
		break;
	    case 2:			/* roll bit left */
		val = ((val << 1) & 0x1fffe) | ((val & 0x10000) >> 16);
		break;
	    case 5:			/* roll nibble right */
		val = ((val >> 4) & 0x01fff) | ((val << 13) & 0x1e000);
		break;
	    case 6:			/* roll nibble left */
		val = ((val << 4) & 0x1fff0) | ((val >> 13) & 0x000f);
		break;
	}
	CFT.r.l = (val & 0x10000) != 0 ? 1 : 0;
	CFT.r.ac = val & 0xffff;
    },

    // OP2 instruction
    OP2: function(){
	CFT.instrDebug("OP2");
	var b = CFT.r.ir & 0x3ff;
	var s = 0;

	// Skips
	s |= (b & 0x8) && (CFT.r.ac & 0x8000) ? 1 : 0;
	s |= (b & 0x4) && (CFT.r.ac == 0) ? 1 : 0;
	s |= (b & 0x2) && (CFT.r.l == 1) ? 1 : 0;
	s |= (b & 0x1) && (CFT.r.v == 1) ? 1 : 0;
	if (b & 0x10) s ^= 1;
	if (s) CFT.r.pc++;

	// Minor operations
	if (b & 0x80) CFT.r.ac = 0; // AC = 0
	if (b & 0x40) {
	    CFT.r.i = 0;	    // I = 0
	    CFT.r.irq = 0;
	}
	if (b & 0x20) {
	    CFT.r.i = 1;            // I = 1
	}
    },
    
    // POP instruction
    POP: function(){
	CFT.instrDebug("POP");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	                 // DR = mem[AGL]
	dr = (dr - 1) & 0xffff;			 // DR--
	Bus.mw(a, dr);				 // mem[AGL] = DR
	CFT.r.ac = Bus.mr(dr);			 // AC = mem[DR]
    },
 
    // ISZ instruction
    ISZ: function(){
	CFT.instrDebug("ISZ");
	var ar = CFT.AGL();
	CFT.r.ac = Bus.mr(ar);                   // AC = mem[AGL]
	CFT.r.ac = (CFT.r.ac + 1) & 0xffff;      // AC++
	Bus.mw(ar, CFT.r.ac);                    // mem[AGL] = AC
	if (CFT.r.ac == 0)
	    CFT.r.pc = (CFT.r.pc + 1) & 0xffff;  // Skip if zero
    },
 
    ISZI: function(){
	CFT.instrDebug("ISZ I");
	var ar = CFT.AGL();
	var dr = Bus.mr(ar);	                 // DR = mem[AGL]
	CFT.r.ac = Bus.mr(dr);                   // AC = mem[DR]
	CFT.r.ac = (CFT.r.ac + 1) & 0xffff;      // AC++
	Bus.mw(dr, CFT.r.ac);                    // mem[AGL] = AC
	if (CFT.r.ac == 0)
	    CFT.r.pc = (CFT.r.pc + 1) & 0xffff;  // Skip if zero
	CFT.maybeAutoIncrement(ar, dr);	         // Autoincrement step
    },

    // LIA instruction
    LIA: function(){
	CFT.instrDebug("LIA");
	CFT.r.ac = CFT.AGL();
    },

    // NOP instruction
    NOP: function(){
	CFT.instrDebug("NOP");
    }
};

// An abstract Bus
Bus = {
    _drivers: [],

    sleep: 0,

    init: function()
    {
	Bus._ram = new Uint16Array(524288);
	Bus._rom = getROM();
	
	for (var i = Bus._drivers.length - 1; i >= 0; i--) {
	    CFT.debug('Initialising ' + Bus._drivers[i].name);
	    if (Bus._drivers[i].init) {
		Bus._drivers[i].init();
	    }
	}
    },

    reset: function()
    {
	for (var i = Bus._drivers.length - 1; i >= 0; i--) {
	    if (Bus._drivers[i].reset) {
		Bus._drivers[i].reset();
	    }
	}
    },
    
    addDriver: function(driver)
    {
	Bus._drivers.push(driver);
    },

    tick: function()
    {
	for (var i = 0; i < Bus._drivers.length; i++) {
	    var x = Bus._drivers[i].tick;
	    if (x) x();
	}
    },
    
    tickUI: function()
    {
	for (var i = 0; i < Bus._drivers.length; i++) {
	    var x = Bus._drivers[i].tickUI;
	    if (x) x();
	}
    },
    
    // Memory space
    mr: function(addr)
    {
	var data = 0x53ef;
	if (addr & 0x8000) {
	    // Reading from ROM
	    data = Bus._rom[addr];
	    //CFT.debug('Read ROM: mem[' + addr.toString(16) + '] -> ' + data.toString(16));
	} else {
	    // Reading from RAM
	    data = Bus._ram[addr];
	    //CFT.debug('Read RAM: mem[' + addr.toString(16) + '] -> ' + data.toString(16));
	}
	return data & 0xffff;
    },
    
    mw: function(addr, data)
    {
	if (addr & 0x8000) {
	    // Attemping to write to ROM
	    //CFT.fail('Attempt to write ROM: mem[' + addr.toString(16) + '] <- ' + data.toString(16));
	} else {
	    // Writing to RAM
	    Bus._ram[addr] = data & 0xffff;
	    //CFT.debug('Write: mem[' + addr.toString(16) + '] <- ' + data.toString(16));
	}
    },
    
    // I/O Space
    
    _printhi: 0,
    ior: function(addr)
    {
	for (var i = Bus._drivers.length - 1; i >= 0; i--) {
	    var data = Bus._drivers[i].ior(addr);
	    if (data >= 0) {
		Bus.sleep = 1;
		return data & 0xffff;
	    }
	}
	CFT.fail('Attempt to read undecoded io[' + addr.toString(16) + ']');
	return 0;
    },
    
    iow: function(addr, data)
    {
	data = data & 0xffff;
	for (var i = Bus._drivers.length - 1; i >= 0; i--) {
	    if (Bus._drivers[i].iow(addr, data) >= 0) {
		Bus.sleep = 1;
		return 0;
	    }
	}
	CFT.fail('Bus error (write to undecoded io[' + addr.toString(16) + '] <- ' + data.toString(16));
	return 0;
    }
};

UCB = {
    code: 'UCB',
    name: 'Microcode Banking unit',

    init: function()
    {
    },
    
    reset: function()
    {
	CFT.r.ucb = 0;
	CFT.r.ucbPerm = 0;
    },

    ior: function(addr)
    {
	return -1;
    },
    
    iow: function(addr, data)
    {
	// Decode addresses 000-00F and 010-01F
	switch (addr & 0xfff0) {
	case 0:	// 000-00F (change bank permanently)
	    CFT.r.ucbPerm = addr & 0xf;
	    DFP.activity(DFP.ACT_LIGHT_UCB);
	    return 1;
	case 1:	// 010-01F (change bank for next instruction onlyx)
	    CFT.r.ucb = addr & 0xf;
	    DFP.activity(DFP.ACT_LIGHT_UCB);
	    return 1;
	}
	return -1;
    }
};

// End of file.
