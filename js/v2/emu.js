// -*- javascript -*-

// Workaround for browsers not supporting Uint16Array
function _Uint8Array(x) {
    if (typeof Uint16Array === 'undefined') return x;
    else return new Uint8Array(x);
}

function _Uint16Array(x) {
    if (typeof Uint16Array === 'undefined') return x;
    else return new Uint16Array(x);
}

function _Uint32Array(x) {
    if (typeof Uint16Array === 'undefined') return x;
    else return new Uint32Array(x);
}

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

$(document).ready(function(){

    // Monkey-patch console
    if (window.console === undefined) {
	window.console = {
	    log: function(){},
	    debug: function(){},
	    info: function(){},
	    warn: function(){},
	    error: function(){},
	    assert: function(){},
	    clear: function(){},
	    dir: function(){},
	    dirxml: function(){},
	    trace: function(){},
	    group: function(){},
	    groupCollapsed: function(){},
	    groupEnd: function(){},
	    time: function(){},
	    timeEnd: function(){},
	    timeStamp: function(){},
	    profile: function(){},
	    profileEnd: function(){},
	    count: function(){},
	    exception: function(){},
	    table: function(){}
	};
    }

    // UI elements
    var x = $('#header').width() + 35;
    setTimeout(function(){$('#header').animate({opacity:0, left:'-=' + x}, 2000)}, 10000);

    // Initialise the emulator
    Bus.init();

    DFP.initUI();

    Bus.addDriver(UCB);
    Bus.addDriver(DFP);
    Bus.addDriver(MBU);
    Bus.addDriver(IRC);

    Bus.init();
    CFT.init();

    Bus.reset();
    CFT.reset().halt();

    var target = 2500000;
    var frames = 0;
    var fps = 0;
    var ticks = 0;
    var max = 1000000;
    var t0 = new Date().getTime();
    
    // Calibrate timing loop
    DFP.updateLights();
    console.log('Calibrating...');

    function loop() {
    	for (i = 0 ; i < max; i++) {
    	    ticks++;
    	    CFT.tick();
    	    Bus.tick();
	    //if (Bus.sleep) i += 100;
    	}
    	setTimeout(loop, 10);
	frames++;
	// if ((frames & 0x1) == 0) {
	//     fps++;
	//     Bus.tickUI();
	// }
    }
    setTimeout(loop, 5);
    
    setInterval(function(){
    	fps++;
    	Bus.tickUI();
    }, 50);

    setTimeout(function(){
    	var measured = ticks / ((new Date().getTime() - t0) / 1000);
    	console.group('Calibration results');
    	console.log('Ticks per second:', measured);
    	console.log('Want:', target);
    	console.log('Current max:', max);
    	max = Math.round(max * target / measured);
    	console.log('New max:', max);
    	console.groupEnd();
    	t0 = new Date().getTime();
    	ticks = 0;
	frames = 0;
    }, 2000);
    
    setInterval(function(){
	if (frames) {
	    var t = new Date().getTime();
    	    console.log('Ticks: %d kHz', ticks / ((t - t0)));
    	    console.log('fps:', fps / 5);
	    fps = 0;
	    //frames = 0;
	    //ticks = 0;
	    //t0 = t;
	}
    }, 5000);

    // Start the processor
    setTimeout(CFT.start, 1000);
});

// End of file.