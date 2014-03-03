// -*- javascript -*-

// A terminal factory which patches the terminal with a medley of VTxxx
// features.
function VTFactory(term){
    term.vtf = {
	write: term.write,
	state: 0
    };
    term.write = function (x) {
	var v = term.vtf;
	var w = v.write;

	switch(v.state) {
	case 0:
	    w(x);
	    break;
	}
    };
    return term;
}

DFP = {
    code: 'DFP',
    name: 'Debugging Front Panel (partial)',

    _printhi: 0,
    _term: null,
    _or: [],
    _queue: [],
    _act: [],
    _actDirty: 0,
    
    ACT_LIGHT_UCB: 0,
    ACT_LIGHT_DFP: 1,
    ACT_LIGHT_MBU: 2,
    ACT_LIGHT_IRC: 3,

    panel: {
	or0: -1,
	or: 0,
	sr: 0,
	act: [0, 0, 0]
    },
    
    features: 0,
    icr: 0,

    reset: function()
    {
	DFP.setOR(0);
	DFP.console('%+r *** Reset *** %-r\n');
    },

    initUI: function()
    {
	DFP._term = new Terminal({
	    x:'auto', y:'auto',
	    greeting: '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n' + 
		'\n\n\n\n\n\n\n\n\n\n\n\n%+r Debugging Front Panel (DFP) console. %-r',
	    cols: 132, rows: 50,
	    frameColor: 'transparent',
	    bgColor: 'transparent',
	    ps: '',
	    handler: termHandler
	});
	DFP._term.open();
	DFP._term.charMode = true;
	//DFP._term = VTFactory(DFP._term);
	
	function termHandler() {
	    this.cursorOn();
	    DFP.queueChar(this.inputChar);
	    // var line = this.lineBuffer;
	    // this.newLine();
	    // if (line != "") {
	    // 	this.write("You typed: " + line);
	    // }
	    // this.prompt();
	}

	///////////////////////////////////////////////////////////////////////////////
	//
	// CREATE THE FRONT PANEL
	//
	///////////////////////////////////////////////////////////////////////////////

	// State
	DFP.panel.or = rand(65536);
	DFP.panel.sr = 0;

	// Construct the HTML

	var p = $('#panel');
	var bits = ['15', '14', '13', '12', '11', '10', '9', '8', '7', '6', '5', '4', '3', '2', '1', '0'];
	var i;
	for (i = 1; i <= 3; i++) {
	    p.append('<tr id="row' + i + 'a" class="rowa"></tr>');
	    p.append('<tr id="row' + i + 'b" class="rowb"></tr>');
	    p.append('<tr id="row' + i + 'c" class="rowc"></tr>');
	}

	DFP._addSpace(1, 4);
	var x = ['IRC', 'MBU', 'DFP', 'µCB'];
	var y = '';
	for (i = 0; i < x.length; i++) y = y + 'r';
	DFP._addrow(1, 'Activity', 'activity', 'n', 'rrrr', x);

	for (i = 0; i < x.length; i++) {
	    DFP._act.push($('#panel #plactivity' + i));
	}

	DFP._addrow(2, 'State', 'state', 'b', 'rrg', ['ERR', 'STOP', 'RUN']);
	DFP._addSpace(2, 1);
	DFP._addrow(2, 'Output Register', 'or', 
		    'n', 'rrrrrrrrrrrrrrrr', bits);

	// Switches
	var s1 = $('#panel #row3a');
	var s2 = $('#panel #row3b');
	var s3 = $('#panel #row3c');
	
	DFP._addSpace(3, 1);
	DFP._addSwitch('swrst', 'swmom r', 'RESET', '', null, null);
	DFP._addSwitch('swrun', 'swmom g', 'RUN', 'STOP', null, null);
	DFP._addSpace(3, 1);

	// The Switch Register
	s1.append('<th colspan="16" class="title">Switch Register' + 
		  '<span class="value"><span id="srval" /><span id="srasm" /><span id="srdec" /></th>');
	for(var i = 15; i >= 0; i--) {
	    var col = i & 4 ? 'r' : 'o';
	    var group = i >> 2;
	    s2.append('<td id="swsr' + i + '" class="swwrap sw2 dn ' + col + '" />');
	    s3.append('<td id="swsr' + i + '_tog" class="pt b swtog swgroup' + group + '">' + i + '</td>');
	    DFP.panel['sw' + i + '_up'] = false;
	    DFP.panel['sw' + i + '_dn'] = false;
	    DFP._or[i] = $('#panel #plor' + i);
	}

	// Add switch content
	$('#panel .swwrap').html('<div class="sw"><a href="#" class="swa" />' + 
				 '<div class="swb" /><a href="#" class="swc" /></div>');
	// Add label content
	$('#panel .swon, #panel .swoff, #panel .swtog, #panel .swmid').
	    addClass('swlabel').wrapInner('<a href="#" />');

	// Attach switch controllers
	$('#panel .swon, #panel .swoff, #panel .swmid, #panel .swtog').
	    bind('mousedown mouseup mouseleave', DFP.clickLabel);
	$('#panel .swa, #panel .swc').bind('mousedown', DFP.clickSwitch);
	$('#panel .swwrap').mouseup(DFP.releaseSwitch);

	// Initialise some buttons.
	var toggle = [15, 14, 10, 9];
	for (i = 0; i < toggle.length; i++) {
	    DFP._switchHandler($('#swsr' + toggle[i]), 'up', true, false);
	    DFP._switchHandler($('#swsr' + toggle[i]), 'up', false, false);
	}

	// Initialise the lights
	DFP.setlight('plstate1', !CFT.halted);
	DFP.setlight('plstate0', CFT.halted);

	// Focus switch register groups
	//DFP.swgroup = 3;
	//$('.swgroup3').addClass('focus');
    },

    console: function(msg)
    {
	//DFP._term.write("\033[0;1;32mfoo");
	DFP._term.write(msg);
    },
   
    ior: function(addr)
    {
	switch (addr) {
	case 0x100:		// LSR
	    //console.log('Read SR', DFP.panel.sr);
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return DFP.panel.sr & 0xffff;

	case 0x101:		// LDSR
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 0x0fff;
	    
	case 0x108:		// QEF
	case 0x109:
	    // See asm/dfp.asm
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    // The feature set is: DEB (but not the PFP), debug TTY,
	    // PRINTx, SENTINEL, Halt on FAIL, Halt on SENTINEL,
	    // running on an emulator.
	    return 0xe1ce;

	case 0x10a:		// ISR
	    // The DFP ISR has extra bits for the IFR1/6 switches. We
	    // don't have the switches, hence the bits are always
	    // clear and only the TTY contributes.
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return DFP.queryChar() ? 8 : 0;
	    
	case 0x111:		// READC (same address as PRINTC)
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return DFP.readChar();
	}

	return -1;
    },

    iow: function(addr, data)
    {
	switch (addr) {
	    
	case 0x100:		// SOR
	    DFP.setOR(data);
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x108:		// ENEF
	    DFP.features |= (data & 0xffff);
	    CFT.hob = DFP.features & 1 ? 1 : 0;
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x109:		// DISEF
	    DFP.features &= (~data) & 0xffff;
	    CFT.hob = DFP.features & 1 ? 1 : 0;
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x10a:		// ICR
	    DFP.icr = data & 0xffff;
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x10f:		// SENTINEL
	    console.error('DFP: SENTINEL instruction encountered');
	    CFT.halt();
	    DFP.updateLights();
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return;
	case 0x111:		// PRINTC
	    DFP.console(String.fromCharCode(data & 0xff));
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;	    
	case 0x112:		// PRINTD
	    if (data & 0x8000) data = -(data & 0x7fff);
	    DFP.console(data.toString(10));
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;	    
	case 0x113:		// PRINTU
	    DFP.console(data.toString(10));
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;	    
	case 0x110:		// PRINTA, same as PRINTH here
	case 0x114:		// PRINTH
	    DFP.console(hex(data, 4));
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;	    
	case 0x115:		// PRINTB
	    DFP.console(bin(data, 16));
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;	    
	case 0x116:		// PRINTSP
	    DFP.console(' ');
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;	    
	case 0x117:		// PRINTNL
	    DFP.console('\n');
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;	    
	case 0x118:		// DEBUGON
	    console.warn('DFP: DEBUGON not implemented');
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x119:		// DEBUGOFF
	    console.warn('DFP: DEBUGOFF not implemented');
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x11a:		// DUMP
	    console.warn('DFP: DUMP not implemented');
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x11b:		// PRINTHI
	    DFP._printhi = data;
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x11c:		// PRINTLO
	    DFP.console(hex(((DFP._printhi << 16) | data) & 0xffffffff, 8));
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x11d:		// HALT
	    CFT.halt();
	    DFP.console('%+r *** Halted *** %-r\n');
	    DFP.updateLights();
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x11e:		// SUCCESS
	    DFP.console('[ok]');
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    return 1;
	case 0x11f:
	    DFP.console('[fail]'); // FAIL
	    DFP.activity(DFP.ACT_LIGHT_DFP);
	    CFT.failed = 1;
	    CFT.halt();
	    DFP.updateLights();
	    return 1;
	}
	return -1;
    },

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

    clickLabel: function(ev) {
	var el = $(ev.target).closest('.swlabel');
	var id = el.attr('id')
	var data = id.split('_');
	var pressed = ev.type == 'mousedown' || ev.type == 'keydown';
	DFP._switchHandler($('#' + data[0]), data[1], pressed, false);
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
	DFP._switchHandler(tgt, pos, pressed, true);
	return false;
    },

    releaseSwitch: function(ev) {
	DFP._switchHandler(ev.target, -1, false, false)
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
	    DFP.panel[name + '_' + pos] = press;
	} else {
	    DFP.panel[name + '_up'] = false;
	    DFP.panel[name + '_mid'] = false;
	    DFP.panel[name + '_dn'] = false;
	}

	// RESET switch
	if (DFP.panel.swrst_up) {
	    CFT.reset().start();
	    Bus.reset();
	    DFP.updateLights();
	}
	if (DFP.panel.swrun_up) {
	    CFT.start();
	    DFP.updateLights();
	}
	if (DFP.panel.swrun_dn) {
	    CFT.halt();
	    DFP.updateLights();
	}

	// The Switch Register
	for (var i = 0; i < 16; i++) {
	    if(DFP.panel['swsr' + i + '_up']) DFP.panel.sr |= 1 << i;
	    else if(DFP.panel['swsr' + i + '_dn']) DFP.panel.sr &= ~(1 << i);
	}
	DFP.show_sr();
    },

    show_sr: function() {
	$('#srval').html('<span class="hex">' + hex(DFP.panel.sr, 4) +
			 '</span><span class="dec">(' + DFP.panel.sr + ')</span>');
    },

    _addSwitch: function(id, type, top, bot, topaction, botaction) {
	var s1 = $('#panel #row3a');
	var s2 = $('#panel #row3b');
	var s3 = $('#panel #row3c');

	s1.append('<td id="' + id + '_up" class="pt b swon">' + top + '</td>');
	s2.append('<td id="' + id + '" class="swwrap ' + type + '" />');
	s3.append('<td id="' + id + '_dn" class="pt b swoff">' + bot + '</td>');
	DFP.panel[id + '_up'] = false;
	DFP.panel[id + '_mid'] = false;
	DFP.panel[id + '_dn'] = false;
    },

    setOR: function(x) {
	DFP.panel.or = x & 0xffff;
    },

    tickUI: function()
    {
	// Have the lights changed?
	if (DFP.panel.or0 !== DFP.panel.or) {
	    DFP.panel.or0 = DFP.panel.or;
	
	    // Set the lights
	    var i, j = 1;
	    var x = DFP.panel.or;
	    for (i = 0; i < 16; i++, j <<= 1) {
		if (x & j) DFP._or[i].addClass('on');
		else DFP._or[i].removeClass('on');
	    }

	    // Show the state
	    $('#mfdval').html('<span class="hex">' + hex(DFP.panel.or, 4) +
			      '</span><span class="dec">(' + DFP.panel.or + ')</span>');
	}

	// Have the activity lights changed?
	if (DFP._actDirty) {
	    DFP._actDirty = 0;
	    for (i = 0; i < DFP._act.length; i++) {
		if (DFP.panel.act[i] > 0) {
		    DFP.panel.act[i]--;
		    DFP._act[i].addClass('on');
		    DFP._actDirty++;
		} else DFP._act[i].removeClass('on');
	    }
	}
    },
    
    activity: function(n) {
	DFP.panel.act[n] = 2;
	DFP._actDirty++;
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

    updateLights: function()
    {
	DFP.setlight('plstate2', CFT.failed);
	DFP.setlight('plstate1', CFT.halted);
	DFP.setlight('plstate0', !CFT.halted);
    },

    queryChar: function()
    {
	return DFP._queue.length > 0;
    },

    readChar: function()
    {
	var x = DFP._queue.shift();
	if (x !== undefined) return x;
	return 0;
    },

    queueChar: function(c)
    {
	if (CFT.halted) return;		// Ignore characters when the CPU is halted
	DFP._queue.push(c);
	console.log(DFP._queue);
	if (DFP.icr & 8) IRC.irq(6);
    }
};

// End of file.