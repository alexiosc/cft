VDU = {
    code: 'VDU',
    name: 'Video Display Unit',

    reset: function()
    {
    },

    initUI: function()
    {
	$('#emutab_vdu').html('<div id="vduwrapper"><canvas id="vdu" width="640" height="480"></canvas></div>');
	VDU._screen = document.getElementById('vdu');
	VDU.screen = VDU._screen.getContext('2d');
	VDU.ticks = 0;

	// Initialise the LUT
	VDU.lut = _Uint32Array([

	    0xff000000, 0xff000055, 0xff0000aa, 0xff0000ff,
	    0xff005500, 0xff005555, 0xff0055aa, 0xff0055ff,
	    0xff00aa00, 0xff00aa55, 0xff00aaaa, 0xff00aaff,
	    0xff00ff00, 0xff00ff55, 0xff00ffaa, 0xff00ffff,
	    
	    0xff550000, 0xff550055, 0xff5500aa, 0xff5500ff,
	    0xff555500, 0xff555555, 0xff5555aa, 0xff5555ff,
	    0xff55aa00, 0xff55aa55, 0xff55aaaa, 0xff55aaff,
	    0xff55ff00, 0xff55ff55, 0xff55ffaa, 0xff55ffff,

	    0xffaa0000, 0xffaa0055, 0xffaa00aa, 0xffaa00ff,
	    0xffaa5500, 0xffaa5555, 0xffaa55aa, 0xffaa55ff,
	    0xffaaaa00, 0xffaaaa55, 0xffaaaaaa, 0xffaaaaff,
	    0xffaaff00, 0xffaaff55, 0xffaaffaa, 0xffaaffff,
	    
	    0xffff0000, 0xffff0055, 0xffff00aa, 0xffff00ff,
	    0xffff5500, 0xffff5555, 0xffff55aa, 0xffff55ff,
	    0xffffaa00, 0xffffaa55, 0xffffaaaa, 0xffffaaff,
	    0xffffff00, 0xffffff55, 0xffffffaa, 0xffffffff

	]);

	// Initialise the off-screen image data to rgba(0,0,0,1.0);
	VDU.imageData = VDU.screen.createImageData(640, 480);
	VDU._buf = new ArrayBuffer(VDU.imageData.data.length);
	VDU._buf8 = new Uint8ClampedArray(VDU._buf);
	VDU._buf32 = new Uint32Array(VDU._buf);

	// Initialise the B, C and CG planes and dirty map
	VDU.b = _Uint8Array(65536);
	VDU.c = _Uint16Array(65536);
	VDU.cg = _Uint8Array(65536);
	//VDU.cg = getROMFont();

	for (i = 0; i < 65536; i++) {
	    VDU.b[i]  = rand(128);
	    VDU.c[i]  = rand(65536) & 0xff3f;
	    VDU.cg[i]  = rand(256);
	}

	// Initialise VDU registers

	VDU.mcr0 = 0;
	VDU.scr0 = 0;
	VDU.sar0 = 0;
	VDU.mar0 = 0;

	VDU.mcr1 = 0;
	VDU.scr1 = 0;
	VDU.sar1 = 0;
	VDU.mar1 = 0;

	VDU.ccr = 0;
	VDU.car = 0;
	VDU.har = 0;
	VDU.kbd = 0;
	VDU.crr = 0;
	VDU.cport = 0;
	VDU.cmd = 0;

	// Running state
	VDU.enabled = 0;
	VDU.irq_vs = 0;
	VDU.irq_sc = 0;
	VDU.irq_vr = 0;
	VDU.irq_kb = 0;
	VDU.dirty = 1;
	VDU.split = 0;
	VDU.cursor_blink = 0;
	VDU.blink = 0;
	VDU.kbd_data = 0;
	
	// Helpers
	VDU.clhmask = new Uint8Array([0xf, 0x7, 0x3, 0x1, 0, 0, 0, 0]);
    },

    ior: function(addr)
    {
	switch (addr) {
	case 0x1f0: // IO_VIDEO_SR
	    var res = 0x1400; // SR_VERSION << 10;
	    if (VDU.enabled) res |= 0x8000;
	    if (VDU.irq_kb) res |= 0x0200;
	    if (VDU.irq_vr) res |= 0x0100;
	    if (VDU.irq_sc) res |= 0x0080;
	    if (VDU.irq_vs) res |= 0x0040;
	    res |= VDU.mcr0 & 0x3f;	// CS2, C40 & CRH fields

	    // Clear interrupt source flags whenever the SR is read
	    VDU.irq_vs = 0;
	    VDU.irq_sc = 0;
	    VDU.irq_vr = 0;
	    return res;

	case 0x1fb: // IO_VIDEO_KBD
	    var res = VDU.kbd_data;
	    VDU.kbd_data &= 0x7fff;	// Clear bit 15.
	    VDU.irq_kb = 0;		// Clear the keyboard IRQ flag
	    return res;

	case 0x1fd: // IO_VIDEO_CRR
	    return VDU.crr;

	case 0x1fa: // IO_VIDEO_HAR
	    return VDU.har;

	case 0x1fe: // IO_VIDEO_CPORT
	    return VDU.cport;

	case 0x1ff: // IO_VIDEO_CMD
	    return VDU.cmd;
	}

	return -1;
    },

    iow: function(addr, data)
    {
	data &= 0xffff;
	switch (addr) {
	case 0x1f0: //IO_VIDEO_MCR0
	    VDU.mcr0 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f1: // IO_VIDEO_MCR1
	    VDU.mcr1 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f2: //IO_VIDEO_SCR0
	    VDU.scr0 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f3: //IO_VIDEO_SCR1
	    VDU.scr1 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f4: //IO_VIDEO_SAR0
	    VDU.sar0 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f5: //IO_VIDEO_SAR1
	    VDU.sar1 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f6: //IO_VIDEO_MAR0
	    VDU.mar0 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f7: //IO_VIDEO_MAR1
	    VDU.mar1 = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f8: //IO_VIDEO_CCR
	    VDU.ccr = data;
	    VDU.dirty++;
	    return 1;

	case 0x1f9: //IO_VIDEO_CAR
	    VDU.car = data;
	    VDU.dirty++;
	    return 1;

	case 0x1fa: //IO_VIDEO_HAR
	    VDU.har = data;
	    VDU.dirty++;
	    return 1;

	case 0x1fb: //IO_VIDEO_KBD
	    console.warn('KBD writes not implemented');
	    return 1;

	case 0x1fd: //IO_VIDEO_CRR
	    VDU.crr = data;
	    VDU.dirty++;
	    return 1;

	case 0x1fe: //IO_VIDEO_CPORT
	    VDU.cport = data;
	    VDU.dirty++;
	    return 1;

	case 0x1ff: //IO_VIDEO_CMD
	    VDU.cmd = data;
	    VDU.runcmd();
	    return 1;
	}

	return -1;
    },

    runcmd: function()
    {
	// Do nothing if GO isn't 0.
	var cmd = VDU.cmd;

	if (VDU.cmd & 0x8000) return;

	var har = VDU.har;
	var bdata = cmd & 0xff;
	var cdata = VDU.cport;

	// This loop simulates the behaviour of the hardware with
	// respect to repetitions. The VDU counts repetitions
	// off-by-one, so that when CRR is 0, the command will execute
	// once. The CRR counts down until it wraps around, then is
	// reset to zero again.
	//
	// This allows single-repeat commands to run without having to
	// write to CRR again.
	do {

	    switch(VDU.cmd & 0x3c00) {
	    case 0x0000:		// Command 0: WBC
		VDU.b[har] = bdata;
		VDU.c[har] = cdata;
		break;

	    case 0x0400: 		// Command 1: WB
		VDU.b[har] = bdata;
		break;

	    case 0x0800:		// Command 2: ORBWC
		VDU.b[har] |= bdata;
		VDU.c[har] = cdata;
		break;

	    case 0x0c00:		// Command 3: ORB
		VDU.b[har] |= bdata;
		break;
		
	    case 0x1000:		// Command 4: ANDBWC
		VDU.b[har] &= bdata;
		VDU.c[har] = cdata;
		
	    case 0x1400:		// Command 5: ANDB
		VDU.b[har] &= bdata;
		
	    case 0x1800:		// Command 6: XORBWC
		VDU.b[har] ^= bdata;
		VDU.c[har] = cdata;
		
	    case 0x1c00:		// Command 7: XORB
		VDU.b[har] ^= bdata;
		
	    case 0x2000:		// Command 8: WC
		VDU.c[har] = cdata;
		break;

	    case 0x2400:		// Command 9: Reserved
	    case 0x2800:		// Command 10: Reserved
		break;

	    case 0x2c00:		// Command 11: WCG
		VDU.cg[har] = bdata;
		break;

	    case 0x3000:		// Command 12: Reserved
		break;

	    case 0x3400:		// Command 13: RBC
		VDU.cmd = (VCU.cmd & 0xff00) | (VDU.b[har] & 0xff);
		VDU.cport = VDU.c[har];
		break;
		
	    case 0x3800:		// Command 14: Reserved
	    case 0x3c00:		// Command 15: Reserved
	    }
	
	    // Increment addresses (if needed)
	    // har = (((har & 0x7f) + (cmd & 0x100 ? 1 : 0)) & 0x7f) |
	    // 	(((har & 0xff80) + (cmd & 0x200 ? 128 : 0)) & 0xff80);
	    har = (har +
		   (cmd & 0x100 ? 1 : 0) +
		   (cmd & 0x200 ? 128 : 0)) & 0xffff;
	    
	} while (VDU.crr--);

	VDU.crr = 0;			// Simulate the hardware
	VDU.har = har & 0xffff;		// Update the HAR
	VDU.cmd |= 0x8000;		// Command done
	VDU.dirty++;
    },

    tickUI: function()    
    {
	VDU.ticks++;
	if ((VDU.ticks & 3) == 0) {
	    VDU.blink++;
	    VDU.dirty++;
	}
	VDU.draw();
    },

    _planeRead: function(clh, paddr, mcr)
    {
	var b = VDU.b[paddr];
	var c = VDU.c[paddr];
	var fg, bg;

	if (c & 0x4000) {		 // Inverse video?
	    fg = VDU.lut[(c >> 8) & 63];
	    bg = VDU.lut[c & 63];
	} else {
	    fg = VDU.lut[c & 63];
	    bg = VDU.lut[(c >> 8) & 63];
	}
	if ((c & 0x8000) && (VDU.blink & 2)) { 		// Blink?
	    fg = bg;
	}
	var cursor = 0;
	if (VDU.car == paddr) {		  // Cursor?
	    switch ((VDU.ccr >> 6) & 3) { // CBC field
	    //case 0:			  // Cursor off
	    case 1:			  // Cursor steady on
		cursor = 1;
		break;
	    case 2:			  // Fast blink
		cursor = VDU.blink & 1;
		break;
	    case 3:			  // Slow blink
		cursor = VDU.blink & 2;
		break;
	    }
	}
	if (cursor) {
	    // The cursor is visible
	    fg = VDU.lut[VDU.ccr & 63];
	    bg = VDU.lut[(VDU.ccr >> 8) & 63];
	}

	// The CG address gathers data from lots of sources.
	var cgaddr = (clh & 15) |
	    ((b & 0xff) << 4) |
	    ((c & 0xc0) << 6) | 
	    ((mcr & 0x30) << 10);

	return [fg, bg, VDU.cg[cgaddr]]
    },


    draw: function()
    {
	if (!VDU.dirty) return;
	VDU.dirty = 0;

	var ctx = VDU.screen;
	var buf = VDU._buf32;
	var lut = VDU.lut;

	var x, y, ofs, colour;
	
	var clhmask;
	var clh;
	var parow, pacol;   // Plane address row/col
	var marcol, marrow; // Modulo row/col
	var pacol_orig;	    // Leftmost column
	var paddr = 0;	    // Composite plane address vector
	var xp;		    // xpos (phase-shifted x ordinate)
	var xmax;	    // 640 (80 columns) or 320 (40 columns)
	var cg;		    // Pixel data from the character generator
	var hscr;	    // Horizontal scrolling
	var mcr;	    // Mode control register

	VDU.split = 0;
	clhmask = VDU.clhmask[VDU.mcr0 & 7];
	xmax = VDU.mcr0 & 8 ? 320 : 640; // 80/40 column mode
	clh = (VDU.scr0 >> 4) & 15;	 // Vertical smooth scrolling
	parow = (VDU.sar0 >> 7) & 511;	 // Plane address, row
	pacol_orig = VDU.sar0 & 127;	 // Plane address, col
	pacol = pacol_orig;
	hscr = VDU.scr0 & 7;		 // Horizontal scrolling
	marcol = VDU.mar0 & 127;	 // Modulo address, column
	marrow = (VDU.mar0 >> 7) & 511;	 // Modulo address, row
	mcr = VDU.mcr0;			 // Mode Control Register

	// Bail out early: is the display disabled?
	if ((VDU.mcr0 & 0x8000) == 0) {
	    ctx.fillStyle = "#000000";
	    ctx.fillRect(0, 0, 640, 480);
	    ctx.fillStyle = "#222222";
	    ctx.textAlign = "center";
 	    ctx.font = "24px Sans Serif";
	    ctx.fillText("Disabled", 320, 240);
	    return;
	}

	// Adjust the SCL for later comparison. 640 is 5 << 8, because
	// the expression is scly_y = (scl - 5) * 2 and we use only
	// one shift for speed.
	var scl_y = (VDU.mcr1 & 0xff00 - 1280) >> 7;
	var car = VDU.car;
	var sen = VDU.mcr1 & 0x80;
	var blink = VDU.blink;
	
	// This is coded to resemble the hardware design of the VDU.
	for (y = 0; y < 480; y++) {
	    ofs = y * 640;
	    x = 0;

	    // Split mode comparison. This is the way it is because of the
	    // way the hardware works.
	    if (y == scl_y) {
		VDU.irq_sc++;		// Signal a scanline interrupt
		if (sen) {		// If enabled, also split the screen now.
		    VDU.split = 1;
				
		    // Update registers for the bottom half of the screen
		    clhmask = VDU.clhmask[VDU.mcr1 & 7]; // Cell height
		    xmax = VDU.mcr1 & 8 ? 320 : 640;  // 80/40 column mode
		    clh = (VDU.scr1 >> 4) & 15;       // Vertical smooth scrolling
		    parow = (VDU.sar1 >> 7) & 511;    // Plane address, row
		    pacol_orig = VDU.sar1 & 127;      // Plane address, col
		    hscr = VDU.scr1 & 7;	      // Smooth scrolling
		    marcol = VDU.mar1 & 127;          // Modulo address, column
		    marrow = (VDU.mar1 >> 7) & 511;   // Modulo address, row
		    mcr = VDU.mcr1;	              // Mode Control Register
		}
	    }

	    // Start of line
	    pacol = pacol_orig;
	    paddr = (pacol & 127) | ((parow & 511) << 7);
	    xp = hscr;			// Initialise horizontal smooth scrolling

	    // Read from planes, set data for first character.
	    var planeData = VDU._planeRead(clh, paddr, mcr);
	    //fg = planeData[0];
	    //bg = planeData[1];
	    cg = planeData[2];
		
	    // Shift the first character according to the horizontal phase
	    cg <<= xp;
	    
	    //console.log('y=%d, clh=%d, pacol=%d, parow=%d, paddr=%d', y, clh, pacol, parow, paddr);
	    for (x = 0; x < xmax; x++) {

		// Draw a pixel in the foreground or background colour.
		colour = cg & 0x80 ? planeData[0] : planeData[1];
		buf[ofs++] = colour;
		if (mcr & 8) buf[ofs++] = colour; // 40 column mode
		cg <<= 1;

		// Step the x ordinate, calculate cell value
		xp++;
		
		// Read plane data every 8 pixels
		if ((xp & 7) == 0) {
		    pacol++;
		    if (pacol > marcol) {
			pacol = 0;
		    }
		    paddr = (pacol & 127) | ((parow & 511) << 7);
		    planeData = VDU._planeRead(clh, paddr, mcr);
		    cg = planeData[2];
		}
	    }
		
	    // Mod-N cell line counter
	    clh = (clh + 1) & clhmask;
		
	    // Row counter
	    if (clh == 0) {
		// Start of next row
		parow++;
		if (parow > marrow) parow = 0;
	    }
	}

	//buf[240 * 640 + 320] = 0xffffffff;

	VDU.imageData.data.set(VDU._buf8);

	// for (i = 0; i < 1024 * 512 * 4; ) {
	//     VDU.vmem.data[i++] = dac[(i >> 6) & 3];
	//     VDU.vmem.data[i++] = dac[(i >> 8) & 3];
	//     VDU.vmem.data[i++] = dac[(i >> 10) & 3];
	//     VDU.vmem.data[i++] = 255;
	// }

	ctx.putImageData(VDU.imageData, 0, 0);
    },
};

// End of file.