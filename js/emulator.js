// -*- javascript -*-

var cft;

function bin(x, pad)
{
    return String('000000000000000000000000000000' + x.toString(2)).slice(-pad);
}

function hex(x, pad)
{
    return String('000000000000000000000000000000' + x.toString(16)).slice(-pad);
}

function rand(x)
{
    return Math.floor(Math.random() * x);
}

(function($) {

    CFTEmulator = {

	VERSION: '0.5',

	RST_HOLD: 3,		// Reset counter

	cpu: {

	    // Microcode engine state
	    ustate: {
		uaddr: 0,	// uPC
		inc: 0,		// Autoincrement
		skip: 0,	// SKIP (0 = yes, 1 = no)
		i: 0,		// Indirection
		op: 0,		// Operation
		l: 0,		// L flag
		v: 0,		// V flag
		irqs: 0,	// Interrupt request
		rst: 0		// Reset pending
	    },

	    upc: 0,		// Microcode address vector
	    control: 0,		// Microcode data vector

	    ar: 0,		// Address register/bus
	    ir: 0,		// Instruction register
	    pc: 0,		// Program counter
	    dr: 0,		// Data register
	    ac: 0,		// Accumulator

	    b: 0,		// ALU B Register
	    
	    dbus: 0,		// Data bus
	    ibus: 0,		// Internal bus

	    l: 0,		// Link reg
	    i: 0,		// Interrupt mask reqg
	    v: 0,		// oVerflow flag
	    n: 0,		// Negative flag
	    i: 0,		// Zero flag
	    irq: 0,		// Interrupt requested (0 = yes, 1 = no)

	    rsthold: 0,		// Reset counter
	    tick: 0,
	    wait: 0,
	    halt: 0,
	    ws: 0
	},

	mem: {
	    ram: null,
	    rom: null
	},

	mbu: {
	    banks: [0, 1, 2, 3, 128, 129, 130, 131]
	},

	init: function(options) {
	    
	    cft = this;

	    this.initPanel();
	    this.initDebug();
	    
	    this.microcode = getMicrocode();

	    //this.ts = new Date();

	    this.fps = 0;	// FPS counter
	    this.cpu.ts = new Date();
	    this.cpu.tick = 0;
	    this.cpu.wait = 0;
	    this.cpu.halt = 1;	// Start halted
	    this.cpu.pause = 0;
	    this.cpu.upc = rand(524288);
	    this.cpu.control = rand(16777216);
	    
	    this.set_ar(rand(65536));
	    this.set_dbus(rand(65536));
	    this.set_ac(rand(65536));
	    this.set_ir(rand(65536));
	    this.set_pc(rand(65536));
	    this.set_dr(rand(65536));
	    this.set_ac(rand(65536));

	    // Randomize registered flags
	    this.cpu.i = rand(2);
	    this.cpu.l = rand(2);

	    this.init_memory();

	    this.resetCPU();
	    setTimeout(this.runCPU, 250);

	    return this;
	},


	///////////////////////////////////////////////////////////////////////////////
	//
	// FRONT PANEL FUNCTIONALITY
	//
	///////////////////////////////////////////////////////////////////////////////

	_addrow: function(row, title, id, nameclass, colours, names) {
	    var p1 = $('#panel #row' + row + 'a');
	    var p2 = $('#panel #row' + row + 'b');
	    var p3 = $('#panel #row' + row + 'c');

	    if (names.length != colours.length) alert("Names and colours must be the same length");
	    p1.append('<th class="title" colspan="' + names.length + '">' + title +
		      '<span class="value"><span id="' + id + 'val" /><span id="' + id + 'asm" /></th>');
	    var i, j = names.length - 1;
	    for (i = 0; i < names.length; i++) {
		p2.append('<td id="pl' + id + (j - i) + '" class="light ' + colours[i] + ' pl' + id + '">&#9679;</td>');
		p3.append('<td id="pt' + id + (j - i) + '" class="pt ' + nameclass + '">' + names[i] + '</td>');
	    }
	},

	_addSpace: function(row, num) {
	    var h = '<td class="space" colspan="' + num + '" />';
	    $('#panel #row' + row + 'a').append(h);
	    $('#panel #row' + row + 'b').append(h);
	    $('#panel #row' + row + 'c').append(h);
	},

	initPanel: function() {

	    // Listen to keyboard events.
	    $(document).bind('keyup keydown', this.panelKeyPressed);

	    // State
	    this.panel = {};
	    this.panel.or = rand(65536);
	    this.panel.sr = 0;

	    // Construct the HTML

	    var p = $('#panel');
	    var bits = ['15', '14', '13', '12', '11', '10', '9', '8', '7', '6', '5', '4', '3', '2', '1', '0'];
	    var i;
	    for (i = 1; i <= 6; i++) {
		p.append('<tr id="row' + i + 'a" class="rowa"></tr>');
		p.append('<tr id="row' + i + 'b" class="rowb"></tr>');
		p.append('<tr id="row' + i + 'c" class="rowc"></tr>');
	    }

	    this._addrow(1,
			 'Micro-Instruction Control Vector', 'control', 'b',
			 'yrgyyyyyyrrrryyyyrrrgggg',
			 ['END', 'W', 'R', 'I/O', 'MEM', 'DEC', 'STP AC', 'STP DR',
			  'INC PC', 'CLI', 'STI', 'CLL', 'CPL', 'IF3', 'IF2', 'IF1', 'IF0',
			  'WU2', 'WU1', 'WU0', 'RU3', 'RU2', 'RU1', 'RU0']);
	    this._addSpace(1, 1);
	    this._addrow(1, 'Interrupt Requests', 'irq', 'n', 'gggggggg', '76543210');

	    this._addrow(2,
			 'Memory Bank Unit', 'aext', 'b',
			 'yyyyyyyy',
			 ['AEXT7<!--<br />ROM-->', 'AEXT6', 'AEXT5', 'AEXT4', 'AEXT3', 'AEXT2', 'AEXT1', 'AEXT0']);
	    this._addrow(2, 'Program Counter', 'pc', 'n', 'rrrrrrrrrrrrrrrr', bits);
	    this._addSpace(2, 1);
	    this._addrow(2, 'Enabled Interrupts', 'irqen', 'n', 'rrrrrrrr', '76543210');

	    this._addrow(3, '', 'mben', 'b', 'g', ['MBEN']);
	    this._addSpace(3, 1);
	    this._addrow(3, 'Flags', 'flags', 'b', 'ggggg', 'NZVIL');
	    this._addSpace(3, 1);
	    this._addrow(3, 'Accumulator', 'ac', 'n', 'rrrrrrrrrrrrrrrr', bits);
	    this._addSpace(3, 1);
	    this._addrow(3, '', 'irq', 'n', 'gggggggg', '76543210');

	    this._addrow(4, 'State', 'state', 'b', 'grryyy', ['RUN', 'STOP', 'WS', 'FETCH', 'EXEC', 'INT']);
	    this._addSpace(4, 2);
	    this._addrow(4, 'Output Register/Data Register/Micro-address vector', 'mfd', 
			 'n', 'rrrrrrrrrrrrrrrr',
			['', 'RST', 'INT', 'V', 'L', 'OP3', 'OP2', 'OP1', 'OP0', 'I', 'SKIP', 'AIDX',
			 'µA3', 'µA2', 'µA1', 'µA0']);
	    this._addSpace(4, 1);
	    this._addrow(4, '', 'gen1', 'n', 'rrrrrrrr', '76543210');

	    this._addSpace(5, 8);
	    this._addrow(5, 'Instruction Register', 'ir',
			 'b', 'yyyyryrrrrrrrrrr', ['OP3', 'OP2', 'OP1', 'OP0', 'I', 'R',
						  '9', '8', '7', '6', '5', '4', '3', '2', '1', '0'])
	    this._addSpace(5, 1);
	    this._addrow(5, 'Microcode Bank', 'ucb', 'n', 'yyyy', ['UCB3', 'UCB2', 'UCB1', 'UCB0']);

	    // Switches
	    var s1 = $('#panel #row6a');
	    var s2 = $('#panel #row6b');
	    var s3 = $('#panel #row6c');
	    
	    this._addSwitch('swrst', 'swmom r', 'RESET', 'START', null, null);
	    this._addSwitch('swrun', 'swmom r', 'RUN', 'STOP', null, null);
	    this._addSwitch('swstep', 'swmom r', 'µSTEP', 'STEP', null, null);
	    
	    // The speed switch
	    s1.append('<td /><td class="pt b swspd swon" id="swspd_up">FAST</td>');
	    s2.append('<td class="pt b swspd swmid" id="swspd_mid">SLOW</td><td id="swspd" class="swwrap sw3 o" />');
	    s3.append('<td /><td class="pt b swspd swoff" id="swspd_dn">CREEP</td>');
	    this.panel['swspd_up'] = false;
	    this.panel['swspd_mid'] = false;
	    this.panel['swspd_dn'] = false;

	    // The lights switch
	    this._addSwitch('swlts', 'sw2', 'LTS ON', 'OFF', null, null);

	    // The MFD switch
	    s1.append('<td class="pt b swmfd swon" id="swmfd_up">OR</td><td />');
	    s2.append('<td id="swmfd" class="swwrap sw3" /><td class="pt b swmfd swmid" id="swmfd_mid">DR</td>');
	    s3.append('<td class="pt b swmfd swoff" id="swmfd_dn">µADDR</td><td />');
	    this.panel['swmfd_up'] = false;
	    this.panel['swmfd_mid'] = false;
	    this.panel['swmfd_dn'] = false;

	    // The Switch Register
	    s1.append('<th colspan="16" class="title">Switch Register' + 
		      '<span class="value"><span id="srval" /><span id="srasm" /><span id="srdec" /></th>');
	    for(var i = 15; i >= 0; i--) {
		var col = i & 4 ? 'o' : 'w';
		var group = i >> 2;
		s2.append('<td id="swsr' + i + '" class="swwrap sw2 dn ' + col + '" />');
		s3.append('<td id="swsr' + i + '_tog" class="pt b swtog swgroup' + group + '">' + i + '</td>');
		this.panel['sw' + i + '_up'] = false;
		this.panel['sw' + i + '_dn'] = false;
	    }

	    this._addSpace(6, 1);

	    // The programming group
	    this._addSwitch('swirpc', 'swmom o', 'SR→IR', '→PC', null, null);
	    this._addSwitch('swac', 'swmom o', '', '→AC', null, null);
	    this._addSwitch('swmemw', 'swmom r', 'MEM W', 'W NEXT', null, null);
	    this._addSwitch('swmemr', 'swmom g', 'MEM R', 'R NEXT', null, null);
	    this._addSwitch('swiow', 'swmom r', 'I/O W', 'W NEXT', null, null);
	    this._addSwitch('swior', 'swmom g', 'I/O R', 'R NEXT', null, null);
	    this._addSwitch('swbnk', 'sw2 o', 'RAM BNK', 'ROM BNK', null, null);
	    this._addSwitch('swirq', 'swmom o', 'IFR1', 'IFR6', null, null);

	    // Add switch content
	    $('#panel .swwrap').html('<div class="sw"><a href="#" class="swa" />' + 
				     '<div class="swb" /><a href="#" class="swc" /></div>');
	    // Add label content
	    $('#panel .swon, #panel .swoff, #panel .swtog, #panel .swmid').
		addClass('swlabel').wrapInner('<a href="#" />');

	    // Attach switch controllers
	    $('#panel .swon, #panel .swoff, #panel .swmid, #panel .swtog').
		bind('mousedown mouseup mouseleave', this.clickLabel);
	    $('#panel .swa, #panel .swc').bind('mousedown', this.clickSwitch);
	    $('#panel .swwrap').mouseup(this.releaseSwitch);

	    // Initialise some buttons.
	    this._switchHandler($('#swspd'), 'up', true, false);
	    this._switchHandler($('#swspd'), 'up', false, false);
	    // this._switchHandler($('#swrun'), 'dn', true, false);
	    // this._switchHandler($('#swrun'), 'dn', false, false);
	    this._switchHandler($('#swlts'), 'up', true, false);
	    this._switchHandler($('#swlts'), 'up', false, false);
	    this._switchHandler($('#swmfd'), 'up', true, false);
	    this._switchHandler($('#swmfd'), 'up', false, false);

	    for (i = 0; i < 3; i++) {
		this._switchHandler($('#swsr' + i), 'up', true, false);
		this._switchHandler($('#swsr' + i), 'up', false, false);
	    }

	    // Focus switch register groups
	    this.swgroup = 3;
	    $('.swgroup3').addClass('focus');
	},

	clickLabel: function(ev) {
	    var el = $(ev.target).closest('.swlabel');
	    var id = el.attr('id')
	    var data = id.split('_');
	    var pressed = ev.type == 'mousedown' || ev.type == 'keydown';
	    cft._switchHandler($('#' + data[0]), data[1], pressed, false);
	    ev.preventDefault();
	    return false;
	},

	clickSwitch: function(ev) {
	    var tgt = $(ev.target);
	    var pressed = ev.type == 'mousedown' || ev.type == 'keydown';
	    var pos = -1;

	    if (tgt.hasClass('swa')) pos = 'up';
	    else if (tgt.hasClass('mid')) pos = 'mid';
	    else if (tgt.hasClass('swc')) pos = 'dn';
	    ev.preventDefault();
	    cft._switchHandler(tgt, pos, pressed, true);
	    return false;
	},
	releaseSwitch: function(ev) {
	    cft._switchHandler(ev.target, -1, false, false)
	    ev.preventDefault();
	    return false;
	},

	_switchHandler: function(el, pos, press, relative) {
	    var sw = $(el).closest('.swwrap');
	    var name = $(sw).attr('id');
	    var mom = sw.hasClass('swmom');
	    if (press) {
		
		if (relative && sw.hasClass('sw3')) {
		    // A relative change up/dn goes to the NEXT state, not the
		    // up or down state. Only works for three-position
		    // (ON-OFF-ON) switches.
		    if (sw.hasClass('up') && pos == 'dn') pos = 'mid';
		    else if (sw.hasClass('dn') && pos == 'up') pos = 'mid';
		}

		if (pos == 'up') sw.removeClass('mid dn').addClass('up');
		else if (pos == 'mid') sw.removeClass('up dn').addClass('mid');
		else if (pos == 'dn') sw.removeClass('up mid').addClass('dn');
		else if (pos == 'tog') {
		    sw.toggleClass('up dn');
		    pos = sw.hasClass('on') ? 'up' : 'dn';
		}
	    } else {
		if (mom) sw.removeClass('up dn').addClass('mid');
	    }

	    // Act on switches moving
	    if (pos !== -1) {
		cft.panel[name + '_' + pos] = press;
	    } else {
		cft.panel[name + '_up'] = false;
		cft.panel[name + '_mid'] = false;
		cft.panel[name + '_dn'] = false;
	    }

	    // Switch lock-out while the processor is running.

	    if (this.cpu.halt == 0 &&
		(this.panel.swstep_up || this.panel.swstep_dn || 
		 this.panel.swac_dn || this.panel.swac_up ||
		 this.panel.swirpc_dn || this.panel.swirpc_up ||
		 this.panel.swmemw_up || this.panel.swmemw_dn ||
		 this.panel.swmemr_up || this.panel.swmemr_dn ||
		 this.panel.swiow_up || this.panel.swiow_dn ||
		 this.panel.swior_up || this.panel.swior_dn)){
		this.debug('This switch is inoperable while the machine is running.\n');
		return;
	    }


	    // RESET/START switch
	    if (this.isPanelReset()) this.resetCPU();
	    if (this.isPanelStart()) {
		this.startCPU();
	    }

	    // RUN/STOP switch
	    if (this.isPanelRun()) {
		this.startCPU();
	    }
	    else if (this.isPanelStop()) this.stopCPU();

	    // STEP/uSTEP switch
	    if (this.isPanelMicrostep()) this.tick();
	    else if (this.isPanelStep()) {
		this.panel.stepping = true;
		this.stepCPU();
	    }
	    
	    // SPEED switch
	    if (this.isPanelFast()) this.t = 1;
	    else if (this.isPanelSlow()) this.t = 100;
	    else if (this.isPanelCreep()) this.t = 500;

	    // MFD switch
	    if (this.panel.swmfd_dn) {
		this.panel.mfd = 0;
		this.setlights('mfd', 16, this.cpu.upc);
	    } else if (this.panel.swmfd_mid) {
		this.panel.mfd = 1;
		this.setlights('mfd', 16, this.cpu.dr);
	    } else if (this.panel.swmfd_up) {
		this.panel.mfd = 2;
		this.setlights('mfd', 16, this.panel.or);
	    }

	    // The light switch
	    if (this.panel.swlts_dn) {
		$('.plcontrol, .plflags, .plir').addClass('force-off');
	    } else if (this.panel.swlts_up) {
		$('.light').removeClass('force-off');
	    }

	    // The Switch Register
	    for (var i = 0; i < 16; i++) {
		if(this.panel['swsr' + i + '_up']) this.panel.sr |= 1 << i;
		else if(this.panel['swsr' + i + '_dn']) this.panel.sr &= ~(1 << i);
	    }
	    this.show_sr();

	    // Programming switches
	    if (this.cpu.halt == 1) {
		if (this.panel.swac_dn || this.panel.swac_up) this.set_ac(this.panel.sr);
		else if (this.panel.swirpc_dn) this.set_pc(this.panel.sr);
		else if (this.panel.swirpc_up) this.set_ir(this.panel.sr);
		
		if (this.panel.swmemw_up || this.panel.swmemw_dn) {
		    this.debug('mem[' + hex(this.cpu.pc, 4) + '] ← ' + hex(this.panel.sr, 4) + '\n');
		    this.memory_write(this.cpu.pc, this.panel.sr);
		    if (this.panel.swmemw_dn) this.set_pc(this.cpu.pc + 1);
		}
		if (this.panel.swmemr_up || this.panel.swmemr_dn) {
		    this.set_ac(this.memory_read(this.cpu.pc));
		    if (this.panel.swmemr_dn) this.set_pc(this.cpu.pc + 1);
		}
		
		if (this.panel.swiow_up || this.panel.swiow_dn) {
		    this.debug('io[' + hex(this.cpu.pc, 4) + '] ← ' + hex(this.panel.sr, 4) + '\n');
		    this.io_write(this.cpu.pc, this.panel.sr);
		    if (this.panel.swiow_dn) this.set_pc(this.cpu.pc + 1);
		}
		if (this.panel.swior_up || this.panel.swior_dn) {
		    this.set_ac(this.io_read(this.cpu.pc));
		    if (this.panel.swior_dn) this.set_pc(this.cpu.pc + 1);
		}
	    }

	    // The unimplemented switches
	    if (this.panel.swbnk_up || this.panel.swbnk_dn) {
		this.debug('Sorry, the memory Banking Unit is not installed.\n')
	    }
	    if (this.panel.swirq_up || this.panel.swirq_dn) {
		this.debug('Sorry, the Interrupt Controller Unit is not installed.\n')
	    }

	    if (this.panel.mfd === 2) this.set_mfd(this.panel.or);

	    this.tickPanel();
	},


	_addSwitch: function(id, type, top, bot, topaction, botaction) {
	    var s1 = $('#panel #row6a');
	    var s2 = $('#panel #row6b');
	    var s3 = $('#panel #row6c');

	    s1.append('<td id="' + id + '_up" class="pt b swon">' + top + '</td>');
	    s2.append('<td id="' + id + '" class="swwrap ' + type + '" />');
	    s3.append('<td id="' + id + '_dn" class="pt b swoff">' + bot + '</td>');
	    this.panel[id + '_up'] = false;
	    this.panel[id + '_mid'] = false;
	    this.panel[id + '_dn'] = false;
	},


	set_mfd: function(x) {
	    this.setlights('mfd', 16, x);
	    $('#mfdval').html('<span class="hex">' + hex(x, 4) +
			      '</span><span class="dec">(' + x + ')</span>');
	},
	
	set_or: function(x) {
	    this.panel.or = x & 0xffff;
	    // Show the state
	    if (this.panel.mfd === 2) {
		this.setlights('mfd', 16, this.panel.or);
		$('#mfdval').html('<span class="hex">' + hex(this.panel.or, 4) +
				 '</span><span class="dec">(' + this.panel.or + ')</span>');
	    }
	    return this.panel.or;
	},

	setlight: function(id, flag) {
	    if (flag) $('#panel #' + id).addClass('on');
	    else $('#panel #' + id).removeClass('on');
	},

	setlights: function(id, len, x) {
	    var i, j = 1;
	    for (i = 0; i < len; i++, j <<= 1) {
	    	if (x & j) {
	    	    $('#panel #pl' + id + i).addClass('on');
	    	} else { 
	    	    $('#panel #pl' + id + i).removeClass('on');
	    	}
	    }
	},


	isPanelReset: function() {
	    return this.panel.swrst_up || this.panel.swrst_dn;
	},

	isPanelStart: function() {
	    return this.panel.swrst_dn;
	},

	isPanelRun: function() {
	    return this.panel.swrun_up;
	},

	isPanelStop: function() {
	    return this.panel.swrun_dn;
	},

	isPanelStep: function() {
	    return this.panel.swstep_dn;
	},

	isPanelMicrostep: function() {
	    return this.panel.swstep_up;
	},

	isPanelFast: function() {
	    return this.panel.swspd_up;
	},

	isPanelSlow: function() {
	    return this.panel.swspd_mid;
	},

	isPanelCreep: function() {
	    return this.panel.swspd_dn;
	},

	tickPanel: function() {

	    // Stop the CPU if the STEP action is done
	    if (this.panel.stepping && this.cpu.tick > 0 && this.cpu.ustate.uaddr == 3) {
		this.panel.stepping = false;
		this.cpu.halt = 1;
	    }

	    // Panel lights

	    // Update flag lights
	    this.setlight('plflags2', this.cpu.v);     // V Flag
	    this.setlight('plflags1', this.cpu.i ^ 1); // I Flag
	    this.setlight('plflags0', this.cpu.l);     // L Flag
	    
	    // Update state lights
	    this.setlight('plstate2', this.cpu.ustate.uaddr < 2 ? 1 : 0); // Fetch
	    this.setlight('plstate1', this.cpu.ustate.uaddr < 2 ? 0 : 1); // Exec
	    
	    // Note: on actual hardware, this light is driven by the FIRQ
	    // signal, which lights up BEFORE the interrupt state is entered
	    // and thus stays lit longer (the microprogram that enters the
	    // Interrupt Service Routine also clears interrupts, resetting the
	    // INT state).
	    this.setlight('plstate0', this.cpu.irq ^ 1); // INT state (really IRQ)
	    this.setlight('plstate4', this.cpu.halt || this.cpu.wait); // Stop state
	    this.setlight('plstate5', this.cpu.halt == 0 && this.cpu.wait == 0); // Run state

	    // Set the MFD to the output register.
	    if (this.panel.mfd === 2) {
		this.setlights('mfd', 16, this.panel.or);
		$('#mfdval').html('<span class="hex">' + hex(this.panel.or, 4) +
				  '</span><span class="dec">(' + this.panel.or + ')</span>');
	    }

	    // Panel switches

	    // Synchronous reset (i.e. reset switch still active)
	    if (this.isPanelReset()) this.resetCPU();
	},


	set_sr: function(x) {

	    this.panel.sr = x & 0xffff;

	    // Update the switches
	    for (var i = 0; i < 16; i++) {
		if (cft.panel.sr & (1 << i)) {
		    $('#swsr' + i).removeClass('dn').addClass('up');
		} else {
		    $('#swsr' + i).removeClass('up').addClass('dn');
		}
	    }

	    this.show_sr();
	},

	show_sr: function() {
	    $('#srval').html('<span class="hex">' + hex(this.panel.sr, 4) +
			     '</span><span class="dec">(' + this.panel.sr + ')</span>');
	    $('#srasm').html(this.disassemble(this.panel.sr));
	},

	simulateToggle: function(id, pos) {
	    $('#' + id + '_' + pos).addClass('focus');
	    cft._switchHandler($('#' + id), pos, true, false);
	    setTimeout(function(){
		$('#' + id + '_' + pos).removeClass('focus');
		cft._switchHandler($('#' + id), pos, false, false);
	    }, 200);
	},


	panelKeyPressed: function(ev) {
	    var plain = ev.shiftKey == false && ev.ctrlKey == false &&
		ev.altKey == false && ev.metaKey == false;
	    var shift = ev.shiftKey == true && ev.ctrlKey == false &&
		ev.altKey == false && ev.metaKey == false;
	    var alt = ev.shiftKey == false && ev.ctrlKey == false &&
		ev.altKey == true && ev.metaKey == false;
	    var shiftalt = ev.shiftKey == true && ev.ctrlKey == false &&
		ev.altKey == true && ev.metaKey == false;
	    if (ev.type == 'keydown') {
		if (plain && ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
			      (ev.keyCode >= 65 && ev.keyCode <= 70))) {
		    var nybble = parseInt(String.fromCharCode(ev.keyCode), 16);
		    var shift = cft.swgroup << 2;
		    
		    cft.set_sr((nybble << shift) | (cft.panel.sr & ~(15 << shift)));
		    
		    //cft.panel.sr = (nybble << shift) | (cft.panel.sr & ~(15 << shift));
		    
		    $('.swtog.swgroup' + cft.swgroup).removeClass('focus');
		    cft.swgroup = (cft.swgroup - 1) & 3;
		    $('.swtog.swgroup' + cft.swgroup).addClass('focus');
		    
		    ev.preventDefault();
		} else if (shift && ev.keyCode == 186) { // Colon
		    cft.simulateToggle('swirpc', 'dn');
		    ev.preventDefault();
		} else if (shift && ev.keyCode == 49) { // Exclamation point
		    cft.simulateToggle('swirpc', 'up');
		    ev.preventDefault();
		} else if (plain && ev.keyCode == 187) { // =
		    cft.simulateToggle('swac', 'dn');
		    ev.preventDefault();
		} else if (shift && (ev.keyCode == 13 || ev.keyCode == 10)) { // Shift-Enter
		    cft.simulateToggle('swmemw', 'dn');
		    ev.preventDefault();
		} else if (alt && ev.keyCode == 82 && ev.altKey == true) { // Alt-R
		    cft.simulateToggle('swrun', 'up');
		    ev.preventDefault();
		} else if (alt && ev.keyCode == 83 && ev.altKey == true) { // Alt-R
		    cft.simulateToggle('swrun', 'dn');
		    ev.preventDefault();
		} else if (shiftalt && ev.keyCode == 82 && ev.altKey == true) { // Shift-Alt-R
		    cft.simulateToggle('swrst', 'up');
		    ev.preventDefault();
		} else if (shiftalt && ev.keyCode == 83 && ev.altKey == true) { // Shift-Alt-R
		    cft.simulateToggle('swrst', 'dn');
		    ev.preventDefault();
		} //else console.log(ev);

	    } else if (ev.type == 'keyup') {
		if (plain && (ev.keyCode == 8 || ev.keyCode == 127)) {
		    $('.swtog.swgroup' + cft.swgroup).removeClass('focus');
		    cft.swgroup = (cft.swgroup + 1) & 3;
		    $('.swtog.swgroup' + cft.swgroup).addClass('focus');
		    ev.preventDefault();
		}
	    }
	},
	    

	///////////////////////////////////////////////////////////////////////////////
	//
	// MICROCODE DECODING FOR MICROCODE v5+
	//
	///////////////////////////////////////////////////////////////////////////////

	get_r_unit: function(x) { return x & 0xf; },
	get_w_unit: function(x) { return (x >> 4) & 0x7; },
	get_op_if: function(x) { return (x >> 7) & 0xf; },

	is_r_agl: function(x) { return this.get_r_unit(x) == 2; },
	is_r_pc: function(x) { return this.get_r_unit(x) == 3; },
	is_r_dr: function(x) { return this.get_r_unit(x) == 4; },
	is_r_ac: function(x) { return this.get_r_unit(x) == 5; },

	is_alu_add: function(x) { return this.get_r_unit(x) == 8; },
	is_alu_and: function(x) { return this.get_r_unit(x) == 9; },
	is_alu_or: function(x) { return this.get_r_unit(x) == 10; },
	is_alu_xor: function(x) { return this.get_r_unit(x) == 11; },
	is_alu_roll: function(x) { return this.get_r_unit(x) == 12; },
	is_alu_not: function(x) { return this.get_r_unit(x) == 13; },

	is_r_cs1: function(x) { return this.get_r_unit(x) == 14; },
	is_r_cs2: function(x) { return this.get_r_unit(x) == 15; },

	is_w_ar: function(x) { return this.get_w_unit(x) == 2; },
	is_w_pc: function(x) { return this.get_w_unit(x) == 3; },
	is_w_ir: function(x) { return this.get_w_unit(x) == 4; },
	is_w_dr: function(x) { return this.get_w_unit(x) == 5; },
	is_w_ac: function(x) { return this.get_w_unit(x) == 6; },
	is_w_alu: function(x) { return this.get_w_unit(x) == 7; },

	is_if3: function(x) { return this.get_op_if(x) == 1 },
	is_if4: function(x) { return this.get_op_if(x) == 2 },
	is_if5: function(x) { return this.get_op_if(x) == 3 },
	is_if6: function(x) { return this.get_op_if(x) == 4 },
	is_if7: function(x) { return this.get_op_if(x) == 5 },
	is_if8: function(x) { return this.get_op_if(x) == 6 },
	is_if9: function(x) { return this.get_op_if(x) == 7 },

	is_ifv: function(x) { return this.get_op_if(x) == 10 },
	is_ifl: function(x) { return this.get_op_if(x) == 11 },
	is_ifzero: function(x) { return this.get_op_if(x) == 12 },
	is_ifneg: function(x) { return this.get_op_if(x) == 13 },
	is_ifroll: function(x) { return this.get_op_if(x) == 14 },
	is_ifbranch: function(x) { return this.get_op_if(x) == 15 },

	_is_nflag: function(x, f) { return (x & f) != f; },
	is_cpl: function(x)   { return this._is_nflag(x, 0x000800); },
	is_cll: function(x)   { return this._is_nflag(x, 0x001000); },
	is_sti: function(x)   { return this._is_nflag(x, 0x002000); },
	is_cli: function(x)   { return this._is_nflag(x, 0x004000); },
	is_incpc: function(x) { return this._is_nflag(x, 0x008000); },
	is_stpdr: function(x) { return this._is_nflag(x, 0x010000); },
	is_stpac: function(x) { return this._is_nflag(x, 0x020000); },
	is_dec: function(x)   { return this._is_nflag(x, 0x040000); },
	is_mem: function(x)   { return this._is_nflag(x, 0x080000); },
	is_io: function(x)    { return this._is_nflag(x, 0x100000); },
	is_r: function(x)     { return this._is_nflag(x, 0x200000); },
	is_wen: function(x)   { return this._is_nflag(x, 0x400000); },
	is_end: function(x)   { return this._is_nflag(x, 0x800000); },

	// Connect the DBUS to the IBUS for reading?
	is_r_dbus: function(x) {
	    return this.is_r(x) && (this.is_mem(x) || this.is_io(x));
	},


	///////////////////////////////////////////////////////////////////////////////
	//
	// RESETTING
	//
	///////////////////////////////////////////////////////////////////////////////

	resetCPU: function() {
	    if (this.cpu.ustate.rst) this.debug('\nReset\n');

	    this.cpu.irq = 1;		/* Clear IRQ (1 = no IRQ received) */
	    this.cpu.v = 0;
            this.cpu.ustate.rst = 0;	/* 0 = -RESET is ACTIVE */
            this.cpu.ustate.irqs = 1;	/* 1 = -INT is not active */
            this.cpu.ustate.inc = 1; 	/* Just being thorough: the reset vector doesn't autoindex */
	    this.cpu.ustate.uaddr = 0;	/* The uPC resets to 0 on power on/reset */
	    this.cpu.ustate.v = 0;
	    this.cpu.ustate.l = 0;
	    this.set_pc(0);
	    this.set_dr(0);
	    this.set_ac(0);

	    this.cpu.rst_hold = this.RST_HOLD; /* Set up reset pulse */
	},

	startCPU: function() {
	    if (this.cpu.halt) this.debug('<span class="r"> Running </span>\n');
	    this.stepCPU();
	    $('body').css('cursor', 'wait');
	},

	stepCPU: function() {
	    this.cpu.wait = 0;
	    this.cpu.halt = 0;
	    this.cpu.ts = new Date();
	    this.cpu.tick = 0;
	},

	stopCPU: function() {
	    this.cpu.wait = 0;
	    this.cpu.halt = 1;
	    var ts1 = new Date();
	    if (this.cpu.tick > 1000) {
		var rate = this.cpu.tick / ((ts1.getTime() - this.cpu.ts.getTime()) / 1000.);
		$('#clockrate').html(rate);
		this.debug('<span class="r"> Halted </span> (' + Math.round(rate) + ' Hz clock)\n');
	    } else {
		this.debug('<span class="r"> Halted </span>\n')// (' + rate + ' Hz clock)\n');
	    }
	    $('body').css('cursor', 'default');
	},

	handleReset: function() {
	    if (this.cpu.rst_hold > 0) {
		this.cpu.rst_hold--;
		return;
	    } else if(this.cpu.rst_hold == 0) {
		/* When the counter runs out, de-assert the RST signal. */
		this.cpu.rst_hold = -1;
		this.cpu.ustate.rst = 1;

		/* In the hardware, the AR assumes the value of the
		 * IBUS the moment RST_HOLD is cleared. */
		this.set_ar(this.cpu.ibus);
		
		this.ucdebug("*** RST_HOLD cleared ***\n");
	    }
	},

	///////////////////////////////////////////////////////////////////////////////
	//
	// LOGGING
	//
	///////////////////////////////////////////////////////////////////////////////

	_term: null,
	initDebug: function() {
	    $('#terminalwrapper').html('<pre id="terminal">&nbsp;\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n' + 
				       '&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n' +
				       '&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n' +
				       '&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n' +
				       '&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n&nbsp;\n' +
				       '<span class="r"> CFT Debug Terminal ready (emulator version ' + 
				       this.VERSION + ') </span>\n</pre>');
	    this._term = $('#terminal');
	    this._term.scrollTop($(this._term).prop('scrollHeight'));
	},

	debug: function(msg) {
	    this._term.append(msg);
	    this._term.scrollTop($(this._term).prop('scrollHeight'));
	},

	regdebug: function(msg) {
	    //this.debugTerm.write('D: ' + msg + '\n');
	},

	ucdebug: function(msg) {
	    //this.debug('uc: ' + msg);
	},

	skipdebug: function(msg) {
	    //this.debug('sbu: ' + msg);
	},

	fail: function(msg) {
	    this.debug('FAIL: ' + msg + '\n');
	},
	
	sanity_check: function(flag, msg) {
	    if (flag) this.fail(msg);
	},

	show: function(name, x, base, pad) {
	    // var s = String('000000000000000000000000000000' + x.toString(base));
	    // $('#state #' + name).html(s.slice(-pad)).addClass('highlight');
	},


	///////////////////////////////////////////////////////////////////////////////
	//
	// DECODING THE INSTRUCTION REGISTER
	//
	///////////////////////////////////////////////////////////////////////////////

	get_op: function(x) { return (x >> 12) & 0xf; },
	get_r: function(x) { return (x & 0x400) == 1 ? 1 : 0; },
	get_offset: function(x) { return x & 0x3ff; },



	///////////////////////////////////////////////////////////////////////////////
	//
	// UNITS ON THE IBUS
	//
	///////////////////////////////////////////////////////////////////////////////

	set_ibus: function(x) {
	    this.cpu.ibus = x & 0xffff;
	    this.show('ibus', this.cpu.ibus, 16, 4);
	    return this.cpu.ibus;
	},

	set_dbus: function(x) {
	    this.cpu.dbus = x & 0xffff;
	    this.show('dbus', this.cpu.dbus, 16, 4);
	    return this.cpu.dbus;
	},

	set_ar: function(x) {
	    this.cpu.ar = x & 0xffff;
	    this.show('ar', this.cpu.ar, 16, 4);
	    return this.cpu.ar;
	},
	
	_instr: ["TRAP", "TRAP I", "IOT", "IOT I", "LOAD", "LOAD I",
		 "STORE", "STORE I", "IN", "IN I", "OUT", "OUT I",
		 "JMP", "JMP I", "JSR", "JSR I", "ADD", "ADD I", "AND", "AND I",
		 "OR", "OR I", "XOR", "XOR I", "OP1", "OP1", "OP2", "POP",
		 "ISZ", "ISZ I", "LI", "JMPII"],

	disassemble: function(x) {
	    var asm = this._instr[(x & 0xf800) >> 11] + ' ';
	    if (x & 0x400) asm = asm + 'R ';
	    asm += '&' + hex(this.get_offset(x), 3);
	    return asm;
	},

	set_ir: function(x) {
	    this.cpu.ir = x & 0xffff;
	    // Autoincrement mode selected for addresses 0080-00FF (active low)
	    this.cpu.ustate.inc = (this.cpu.ir & 0xf80) == 0xc80 ? 0 : 1;
	    //console.log('INC = ' + this.cpu.ustate.inc);

	    //this.show('irval', this.cpu.ir, 16, 4);
	    //this.debug('IR = &' + hex(this.cpu.ir, 4));
	    this.setlights('ir', 16, this.cpu.ir);

	    // Disassemble

	    $('#irval').html('<span class="hex">' + hex(this.cpu.ir, 4) + '</span>');
	    $('#irasm').html(this.disassemble(this.cpu.ir));

	    return this.cpu.ir;
	},

	set_pc: function(x) {
	    this.cpu.pc = x & 0xffff;
	    this.show('pc', this.cpu.pc, 16, 4);
	    this.regdebug('PC = &' + hex(this.cpu.pc, 4));
	    this.setlights('pc', 16, this.cpu.pc);
	    $('#pcval').html('<span class="hex">' + hex(this.cpu.pc, 4) + '</span>');
	    return this.cpu.pc;
	},

	set_dr: function(x) {
	    this.cpu.dr = x & 0xffff;
	    this.show('dr', this.cpu.dr, 16, 4);
	    this.regdebug('DR = &' + hex(this.cpu.dr, 4));
	    if (this.panel.mfd === 1) this.set_mfd(this.cpu.dr);
	    return this.cpu.dr;
	},

	set_ac: function(x) {
	    this.cpu.ac = x & 0xffff;
	    this.cpu.n = (this.cpu.ac & 0x8000) != 0 ? 1 : 0;
	    this.cpu.z = (this.cpu.ac == 0) ? 1 : 0;
	    
	    // Show the state
	    //this.show('ac', this.cpu.ac, 16, 4);
	    //this.regdebug('AC = &' + hex(this.cpu.ir, 4));
	    this.setlights('ac', 16, this.cpu.ac);
	    this.setlight('plflags4', this.cpu.n);
	    this.setlight('plflags3', this.cpu.z);
	    $('#acval').html('<span class="hex">' + hex(this.cpu.ac, 4) + '</span>' +
			     '</span><span class="dec">(' + this.cpu.ac + ')</span>');


	    return this.cpu.ac;
	},

	set_alu: function(x) {
	    this.cpu.b = x & 0xffff;
	    this.show('b', this.cpu.b, 16, 4);
	},

	unit_agl: function() {
	    var page = this.cpu.pc & 0xfc00;
	    this.regdebug('AGL: page=&' + hex(page, 4) + ', offset=&' + hex(this.get_offset(this.cpu.ir), 3));
	    if (this.cpu.ir & 0x400) return this.get_offset(this.cpu.ir);
	    else return page | this.get_offset(this.cpu.ir);
	},

	unit_cs1: function() {
	    if (this.cpu.ustate.rst == 0) return 0xfff0; /* Reset vector */
	    else if (this.cpu.ustate.rst == 1 && this.cpu.ustate.irqs == 0) return 2; /* ISR return vector */
	    else if (this.cpu.ustate.rst == 1 && this.cpu.ustate.irqs == 1) return 0; /* JSR return vector */
	    this.fail("CS1: sanity check failed.");
	},

	unit_cs2: function()
	{
	    if (this.cpu.ustate.rst == 1 && this.cpu.ustate.irqs == 0) return 0xfff8; /* ISR vector */
	    else if (this.cpu.ustate.rst == 1 && this.cpu.ustate.irqs == 1) return 1; /* TRAP return vector */
	    this.fail("CS2: sanity check failed.");
	},

	unit_roll: function()
	{
	    var op = this.cpu.ir & 7;
	    var val = (this.cpu.l << 16) | this.cpu.ac;

	    switch (op) {
	    case 6:			/* roll nibble left */
		val = ((val << 4) & 0x1fff0) | ((val >> 13) & 0x000f);
		break;
	    case 5:			/* roll nibble right */
		val = ((val >> 4) & 0x01fff) | ((val << 13) & 0x1e000);
		break;
	    case 2:			/* roll bit left */
		val = ((val << 1) & 0x1fffe) | ((val & 0x10000) >> 16);
		break;
	    case 1:			/* roll bit right */
		val = ((val >> 1) & 0x0ffff) | ((val & 0x00001) << 16);
		break;
	    }
	    
	    //this.cpu.ibus = (val & 0xffff);
	    this.cpu.l = (val & 0x10000) != 0 ? 1 : 0;
	    return val & 0xffff;
	},






	///////////////////////////////////////////////////////////////////////////////
	//
	// MEMORY (AND THE MBU)
	//
	///////////////////////////////////////////////////////////////////////////////

	init_memory: function()
	{
	    this.ram = getROM();
	},

	unit_mem: function(r, w)
	{
	    if (r && !w) this.memory_read(this.cpu.ar);
	    else if (w && !r) this.memory_write(this.cpu.ar, this.cpu.dbus);
	    else this.fail("Invalid memory access r=" + r + ", w=" + w);
	    return this.cpu.dbus;
	},

	memory_read: function(addr)
	{
	    this.regdebug('RAM: read &' + hex(addr, 4) + ' = &' + hex(this.ram[addr & 0xffff], 4));
	    return this.set_dbus(this.ram[addr & 0xffff]);
	},

	memory_write: function(addr, x)
	{
	    this.regdebug('RAM: write &' + hex(addr, 4) + ' ← &' + hex(x, 4));
	    //console.log('RAM: write &' + hex(addr, 4) + ' ← &' + hex(x, 4));
	    if ((addr & 0xffff) >= 0xc000) {
		this.debug('<span class="r"> Attempted to write &' + hex(x, 4) + ' to ROM address &' + hex(addr, 4) + '. </span>\n');
	    }
	    this.ram[addr & 0xffff] = x;
	    return this.set_dbus(x);
	},

	unit_io: function(r, w)
	{
	    if (r && !w) {
		this.io_read(this.cpu.ar);
		this.regdebug('IN: &' + hex(this.cpu.ar, 4));
	    } else if (w && !r) {
		this.io_write(this.cpu.ar, this.cpu.dbus);
		this.regdebug('OUT: &' + hex(this.cpu.ar, 4) + '← &' + hex(this.cpu.dbus, 4));
	    } else this.fail("Invalid I/O access r=" + r + ", w=" + w);
	    return this.cpu.dbus;
	},

	io_write: function(addr, x)
	{
	    switch (addr & 0x3ff) {
	    case 0x32:
		this.set_or(x);
		break;
		
	    case 0x37:
		this.stopCPU();
		break;
		
	    case 0x3ef:
		this.debug('<span class="r"> Failure </span> (sentinel instruction executed)\n');
		this.stopCPU();
		break;
		
	    case 0x3f1:
		this.debug(String.fromCharCode(x));
		break;

	    case 0x3f0:
	    case 0x3f4:
		this.debug(hex(x, 4));
		break;

	    case 0x3f2:
		this.debug(x);
		break;

	    case 0x3f5:
		this.debug(bin(x, 16));
		break;
		
	    case 0x3f6:
		this.debug(' ');
		break;
		
	    case 0x3f7:
		this.debug('\n');
		break;

	    case 0x3fe:
		this.debug('<span class="r"> Success </span>\n');
		break;
		
	    case 0x3ff:
		this.debug('<span class="r"> Fail </span> (FAIL instruction)\n');
		break;
		
	    }
	},


	io_read: function(addr)
	{
	    switch (addr & 0x3ff) {
	    case 0x30:
		return this.set_dbus(this.panel.sr & 0xffff);
	    }
	},




	///////////////////////////////////////////////////////////////////////////////
	//
	// SKIP AND BRANCH UNIT
	//
	///////////////////////////////////////////////////////////////////////////////

	decode_ifx: function() {
	    this.cpu.ustate.skip = 0;
	    if (this.is_if9(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0x200) != 0;
		this.skipdebug("IF9");
	    } else if (this.is_if8(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0x100) != 0;
		this.skipdebug("IF8");
	    } else if (this.is_if7(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0x80) != 0;
		this.skipdebug("IF7");
	    } else if (this.is_if6(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0x40) != 0;
		this.skipdebug("IF6");
	    } else if (this.is_if5(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0x20) != 0;
		this.skipdebug("IF5");
	    } else if (this.is_if4(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0x10) != 0;
		this.skipdebug("IF4");
	    } else if (this.is_if3(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0x8) != 0;
		this.skipdebug("IF3");
	    } else if (this.is_ifbranch(this.cpu.control)) {
		/*
		 * For branches, instead of having a separate mechanism, the
		 * branch decision is put in the SKIP flag. This way, the same
		 * code can be used for conditional execution of the OPx
		 * instructions AND for branching (which is handled in OP2
		 * after all).
		 */
		
		/* Simulate the hardware exactly. */
		var data = [
		    this.cpu.ir & 1,
		    (this.cpu.ir & 2) >> 1,
		    (this.cpu.ir & 4) >> 2,
		    (this.cpu.ir & 8) >> 3,
		    (this.cpu.ir & 16) >> 4
		];

		/* This looks like a waste of space, but gcc optimises it to
		 * the same assembly code as if we used one long, hard to read
		 * expression. */
		var sn = this.cpu.n & data[3];
		var sz = this.cpu.z & data[2];
		var sl = this.cpu.l & data[1];
		var sv = this.cpu.v & data[0];

		var sx = sn || sz || sl || sv;
		
		this.cpu.ustate.skip = sx ^ data[4];

		this.skipdebug("IFBRANCH");
	    } else if (this.is_ifroll(this.cpu.control)) {
		this.cpu.ustate.skip = 0 + (this.cpu.ir & 0xb) != 0;
		this.skipdebug("IFROLL");
	    } else if (this.is_ifzero(this.cpu.control)) {
		this.cpu.ustate.skip = this.cpu.z ? 1 : 0;
	    } else if (this.is_ifl(this.cpu.control)) {
		this.cpu.ustate.skip = this.cpu.l ? 1 : 0;
	    } else if (this.is_ifv(this.cpu.control)) {
		this.cpu.ustate.skip = this.cpu.v ? 1 : 0;
	    } else if (this.get_op_if(this.cpu.control) == 0) {
		// Idle branch unit.
	    } else {
		fail('Emulator failure: OPIF value ' + GET_OP_IF(this.cpu.control) + ' not implemented.');
	    }

	    // Microcode version 4+ assumes active-low semantics for SKIP. Invert here.
	    this.cpu.ustate.skip = this.cpu.ustate.skip ^ 1;
	},



	///////////////////////////////////////////////////////////////////////////////
	//
	// READ AND WRITE FROM UNITS -- IBUS SIMULATION
	//
	///////////////////////////////////////////////////////////////////////////////

	decode_read_unit: function() {
	    if (this.is_r_dbus(this.cpu.control)) this.set_ibus(this.cpu.dbus);
	    else if (this.is_r_agl(this.cpu.control)) this.set_ibus(this.unit_agl());
	    else if (this.is_r_pc(this.cpu.control)) this.set_ibus(this.cpu.pc);
	    else if (this.is_r_dr(this.cpu.control)) this.set_ibus(this.cpu.dr);
	    else if (this.is_r_ac(this.cpu.control)) this.set_ibus(this.cpu.ac);
	    else if (this.is_r_cs1(this.cpu.control)) this.set_ibus(this.unit_cs1());
	    else if (this.is_r_cs2(this.cpu.control)) this.set_ibus(this.unit_cs2());
	    else if (this.is_alu_add(this.cpu.control)) {
		var sum = (this.cpu.ac & 0xffff) + (this.cpu.b & 0xffff);
		this.set_ibus(sum);
		
		// Toggle L on carry out
		if (sum & 0x10000) this.cpu.l = this.cpu.l ^ 1;

		// Set overflow flag
		this.cpu.v = ((this.cpu.ac & 0x8000) == (this.cpu.b & 0x8000) && 
		    (this.cpu.ac & 0x8000) != (this.cpu.ibus & 0x8000)) ? 1 : 0;
		this.ucdebug("IBUS <- A + B"); // (%04x), L <- %d\n", this.cpu.b, this.cpu.l);
	    }
	    else if (this.is_alu_and(this.cpu.control)) {
		this.set_ibus((this.cpu.ac & 0xffff) & (this.cpu.b & 0xffff));
		this.ucdebug("IBUS <- A AND B"); // (%04x)\n", this.cpu.b);
	    }
	    else if (this.is_alu_or(this.cpu.control)) { 
		this.set_ibus(this.cpu.ac | this.cpu.b);
		this.ucdebug("IBUS <- A OR B"); // (%04x)\n", this.cpu.b);
	    }
	    else if (this.is_alu_xor(this.cpu.control)) {
		this.set_ibus(this.cpu.ac ^ this.cpu.b);
		this.ucdebug("IBUS <- A XOR B"); // (%04x) XOR B (%04x)\n", this.cpu.ac, this.cpu.b);
	    }
	    else if (this.is_alu_not(this.cpu.control)) {
		this.set_ibus(this.cpu.ac ^ 0xffff);
		this.ucdebug("IBUS <- NOT A"); // (%04x)\n", this.cpu.ac);
	    }
	    else if (this.is_alu_roll(this.cpu.control)) {
		this.set_ibus(this.unit_roll());
		// this.ucdebug handled inside unit for clarity.
	    }
	},


	
	decode_write_unit: function() {
	    if (this.get_w_unit(this.cpu.control) == 0) return;
	    
	    if (this.is_w_ar(this.cpu.control)) this.set_ar(this.cpu.ibus);
	    else if (this.is_w_pc(this.cpu.control)) this.set_pc(this.cpu.ibus);
	    else if (this.is_w_ir(this.cpu.control)) this.set_ir(this.cpu.ibus);
	    else if (this.is_w_dr(this.cpu.control)) this.set_dr(this.cpu.ibus);
	    else if (this.is_w_ac(this.cpu.control)) this.set_ac(this.cpu.ibus);
	    else if (this.is_w_alu(this.cpu.control)) this.set_alu(this.cpu.ibus);
	    else {
		sanity_check(0, "Write unit decoder: should never happen.\n");
	    }
	},


	runCPU: function() {
	    // var PERIOD = 100;
	    // if (cft.fps++ == PERIOD) {
	    // 	cft.fps = 0;
	    // 	var t0 = cft.ts.getTime();
	    // 	cft.ts = new Date();
	    // 	//console.log( 1000 * PERIOD / (cft.ts.getTime() - t0));
	    // }


	    if (cft.t < 15) {
		var i = 10;
		while (--i) {
		    if (cft.cpu.halt == 0 && cft.cpu.wait == 0) {
			//console.log('**');
			cft.tick();
			cft.tickSyncPeripherals();
		    }
		    cft.tickAsyncPeripherals();
		}
	    } else {
		if (cft.cpu.halt == 0 && cft.cpu.wait == 0) {
		    cft.tick();
		    cft.tickSyncPeripherals();
		}
		cft.tickAsyncPeripherals();
	    }
	    
	    setTimeout(cft.runCPU, cft.t);
	},



	tick: function() {

	    //$('#state *').removeClass('highlight');
	    
	    // Link bits in the microcode engine with the IR.
	    this.cpu.ustate.op = this.get_op(this.cpu.ir);
	    this.cpu.ustate.i = this.cpu.ir & 0x0800 ? 1 : 0;
	    
	    // Reset the I bit when a new microprogram starts (not strictly
	    // needed, may go away).
	    if (this.cpu.ustate.uaddr == 0) this.cpu.ustate.i = 0;

	    // Buffer interrupt requests until the start of a new microprogram.
	    if (this.cpu.irq == 0) {
		if ((this.cpu.ustate.uaddr == 0) && (this.cpu.i == 0)) {
		    this.cpu.irq = 1;	      // Clear the IRQ signal
		    this.cpu.ustate.irqs = 0; // Set the INT microcode condition
		}
	    }

	    // Handle any reset pulses
	    this.handleReset();

	    // Construct the microcode address
	    var ucb = 0;	// For future expansion.
	    var upc = ucb;
	    
	    upc = ((this.cpu.ustate.uaddr & 0xf) |
		   ((this.cpu.ustate.inc & 1) << 4) |
		   ((this.cpu.ustate.skip & 1) << 5) |
		   ((this.cpu.ustate.i & 1) << 6) |
		   ((this.cpu.ustate.op & 15) << 7) |
		   ((this.cpu.ustate.l & 1) << 11) |
		   ((this.cpu.ustate.v & 1) << 12) |
		   ((this.cpu.ustate.irqs & 1) << 13) |
		   ((this.cpu.ustate.rst & 1) << 14)) & 0x7fff;

	    // $('#state #uaddrasm').html('RST:<b>' + this.cpu.ustate.rst + '</b> ' +
	    // 			       'INT:<b>' + this.cpu.ustate.irqs + '</b> ' +
	    // 			       'V:<b>' + this.cpu.ustate.v + '</b> ' +
	    // 			       'L:<b>' + this.cpu.ustate.l + '</b> ' +
	    // 			       'OP:<b>' + bin(this.cpu.ustate.op, 4) + '</b> ' +
	    // 			       'I:<b>' + this.cpu.ustate.i + '</b> ' +
	    // 			       'SKIP:<b>' + this.cpu.ustate.skip + '</b> ' +
	    // 			       'INC:<b>' + this.cpu.ustate.inc + '</b> ' +
	    // 			       'µPC:<b>' + bin(this.cpu.ustate.uaddr, 4) + '</b>');

	    this.cpu.upc = upc;
	    this.cpu.control = this.microcode[upc];
	    this.show('control', this.cpu.control, 2, 24);
	    this.show('uaddr', upc, 2, 15);

	    // Disassemble the control vector
	    var asm = [];
	    var wunits = ['', '', 'AR', 'PC', 'IR', 'DR', 'AC', 'ALU'];
	    var runits = ['', '', 'AGL', 'PC', 'DR', 'AC', '', '',
			  'ADD', 'AND', 'OR', 'XOR', 'ROLL', 'NOT', '', ''];

	    var x;
	    if(this.is_wen(this.cpu.control)) {
		if (this.is_mem(this.cpu.control)) x = 'mem[' + hex(this.cpu.ar, 4) + '] ← ';
		if(this.is_io(this.cpu.control)) x = 'io[' + hex(this.cpu.ar, 4) + '] ← ';
	    } else {
		x = wunits[this.get_w_unit(this.cpu.control)];
		if (x) x += ' ← ';
	    }

	    if (this.cpu.ustate.rst == 0) x += '&fff0';
	    else if (this.is_r(this.cpu.control)) {
		if (this.is_mem(this.cpu.control)) x += 'mem[' + hex(this.cpu.ar, 4) + ']';
		if(this.is_io(this.cpu.control)) x += 'io[' + hex(this.cpu.ar, 4) + ']';
	    } else x += runits[this.get_r_unit(this.cpu.control)];
	    
	    if (x) asm.push(x);

	    if(this.is_if3(this.cpu.control)) asm.push("if3");
	    if(this.is_if4(this.cpu.control)) asm.push("if4");
	    if(this.is_if5(this.cpu.control)) asm.push("if5");
	    if(this.is_if6(this.cpu.control)) asm.push("if6");
	    if(this.is_if7(this.cpu.control)) asm.push("if7");
	    if(this.is_if8(this.cpu.control)) asm.push("if8");
	    if(this.is_if9(this.cpu.control)) asm.push("if9");
	    if(this.is_ifv(this.cpu.control)) asm.push("ifv");
	    if(this.is_ifl(this.cpu.control)) asm.push("ifl");
	    if(this.is_ifzero(this.cpu.control)) asm.push("ifzero");
	    if(this.is_ifneg(this.cpu.control)) asm.push("ifneg");
	    if(this.is_ifroll(this.cpu.control)) asm.push("ifroll");
	    if(this.is_ifbranch(this.cpu.control)) asm.push("ifbranch");
	    if(this.is_cpl(this.cpu.control)) asm.push("cpl");
	    if(this.is_cll(this.cpu.control)) asm.push("cll");
	    if(this.is_sti(this.cpu.control)) asm.push("sti");
	    if(this.is_cli(this.cpu.control)) asm.push("cli");
	    if(this.is_incpc(this.cpu.control)) asm.push("incpc");
	    if(this.is_stpdr(this.cpu.control)) asm.push("stpdr");
	    if(this.is_stpac(this.cpu.control)) asm.push("stpac");
	    if(this.is_dec(this.cpu.control)) asm.push("dec");
	    // if(this.is_mem(this.cpu.control)) asm.push("mem");
	    // if(this.is_io(this.cpu.control)) asm.push("io");
	    // if(this.is_r(this.cpu.control)) asm.push("r");
	    // if(this.is_wen(this.cpu.control)) asm.push("wen");
	    if(this.is_end(this.cpu.control)) asm.push("end");

	    $('#controlasm').html(asm.join('; '));
	    this.setlights('control', 24, this.cpu.control ^ 0xfff800);

	    //$('#foo').append($('#state #uaddrasm').html()+ ': ' + asm.join(', ') + '\n');

	    // Decode the control vector from the Microcode Engine.
	    var cpl = this.is_cpl(this.cpu.control);
	    var cll = this.is_cll(this.cpu.control);
	    var sti = this.is_sti(this.cpu.control);
	    var cli = this.is_cli(this.cpu.control);
	    var incpc = this.is_incpc(this.cpu.control);
	    var stpac = this.is_stpac(this.cpu.control);
	    var stpdr = this.is_stpdr(this.cpu.control);
	    var dec = this.is_dec(this.cpu.control);
	    var mem = this.is_mem(this.cpu.control);
	    var io = this.is_io(this.cpu.control);
	    var r = this.is_r(this.cpu.control);
	    var w = this.is_wen(this.cpu.control);
	    var end = this.is_end(this.cpu.control);

	    // Decode the IFx sub-field.
	    this.decode_ifx();
	    
	    // Handle memory and I/O *READS*
	    this.sanity_check (mem && io, "MEM and IO selected at once. Microcode bug.");
	    this.sanity_check (r && w, "R and W selected at once. Microcode bug.");
	    if (r && mem) this.set_dbus(this.unit_mem(r, w));
	    else if (r && io) this.set_dbus(this.unit_io(r, w));

	    // Read from a unit.
	    this.decode_read_unit();

	    // Write to a unit.
	    this.decode_write_unit();

	    // Drive the data bus if needed
	    if (this.is_wen(this.cpu.control)) {
		this.set_dbus(this.cpu.ibus);
	    }

	    // Handle memory and I/O *WRITES*
	    if (w && mem) this.unit_mem(r, w);
	    else if (w && io) this.unit_io(r, w);

	    // Step the PC
	    if (incpc) this.set_pc(this.cpu.pc + 1);
	    
	    // Increment A, if requested by an OPx instruction.
	    if (stpac) {
		if (dec) {
		    this.set_ac(this.cpu.ac - 1);
		    if (this.cpu.ac == 0xffff) this.cpu.l = this.cpu.l ^ 1;
		} else {
		    this.set_ac(this.cpu.ac + 1);
		    if (this.cpu.ac == 0) this.cpu.l = this.cpu.l ^ 1;
		}
	    }

	    // Step the DR.
	    if (stpdr) {
		if (dec) this.set_dr(this.cpu.dr - 1);
		else this.set_dr(this.cpu.dr + 1);
	    }

	    // Set other stuff
	    if (cpl) this.cpu.l = this.cpu.l ^ 1;
	    if (cll) this.cpu.l = 0;
	    if (sti) this.cpu.i = 0; /* The /I flag is Active low */
	    if (cli) this.cpu.i = 1;

	    // Update the CPU microcode state
	    this.cpu.ustate.l = this.cpu.l;
	    this.cpu.ustate.v = this.cpu.v;
	    if (this.panel.mfd === 0) this.set_mfd(this.cpu.upc);

	    // Next!
	    this.cpu.tick++;

	    // End of the instruction?
	    if (end) {
		this.cpu.ustate.uaddr = 0;
		this.cpu.ustate.irqs = 1; /* Clear the INT microcode condition */
		this.ucdebug("*** GO FETCH\n");

	    } else if (!this.cpu.wait) {
		this.cpu.ustate.uaddr = (this.cpu.ustate.uaddr + 1) & 0xf;
		this.sanity_check(this.cpu.ustate.uaddr == 0,
				  "uADDR wrapped around! Microcode bug?");
	    }
	    
	    //this.ucdebug("Tick!");

	},


	tickAsyncPeripherals: function() {
	},


	tickSyncPeripherals: function() {
	    this.tickPanel();
	},


	_null: null
    };

})(jQuery);

// End of file.
