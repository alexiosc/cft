// -*- javascript -*-

$(document).ready(function(){
    $('div.float, div.figure').not('.width-processed').each(function(i, el){
	var el = $(el);
	var max = 0;
	el.find('img, table, svg').each(function(i, el){
	    var w = $(el).width();
	    if (w == 0) return;
	    if (w > max) max = w;
	});
	if (max > 0) {
	    $(el).attr('data-max-width', max);
	    $(el).addClass('width-processed width-' + (Math.round((max + 100) / 100) * 100));
	}
    });
});

function makeModeDemoWidget()
{
    var base = '../generated/vdu-test-image3-';
    var images = '';
    var w, h;
    
    for (h = 30; h <= 480; h = h << 1) {
	for (w = 40; w <= 640; w = w << 1) {
	    var modeType = {40:'m', 80:'m', 160:'s', 320:'g', 640:'g'}[w];
	    console.log(base + w + 'x' + h + modeType + '.png');
	    images = images + '<img style="display:none" id="mode' + w + 'x' + h + '" ';
	    images = images + 'src="' + base + w + 'x' + h + modeType + '.png" />';
	}
    }

    var b = $('body');
    b.append('<style type="text/css">');
    b.append('</style>');

    var modeDescr = {40:'text / multicolour',
		     80:'text / multicolour',
		     160:'semigraphics',
		     320:'graphics (with dithering)',
		     640:'graphics (with dithering)'};

    $('#modeDemo').html('<table class="sans-serif">' + 
               '  <tr><td id="modeSample" rowspan="5" colspan="5">' + images +
               '  <div class="info">40×30 ' + modeDescr[40] + '</div></td>' + 
               '  <td class="first"><a class="rows active" data-rows="30" id="modeX30" href="#">×30</td></tr>' +
               '  <tr><td><a class="rows" data-rows="60" id="modeX60" href="#">×60</td></tr>' +
               '  <tr><td><a class="rows" data-rows="120" id="modeX120" href="#">×120</td></tr>' +
               '  <tr><td><a class="rows" data-rows="240" id="modeX240" href="#">×240</td></tr>' +
               '  <tr><td class="last"><a class="rows" data-rows="480" id="modeX480" href="#">×480</td></tr>' +
               '  <tr>' +
               '  <td class="first"><a class="cols active" data-cols="40" id="mode40X" href="#">40×</td>' +
               '  <td><a class="cols" data-cols="80" id="mode80X" href="#">80×</td>' +
               '  <td><a class="cols" data-cols="160" id="mode160X" href="#">160×</td>' +
               '  <td><a class="cols" data-cols="320" id="mode320X" href="#">320×</td>' +
               '  <td class="last"><a class="cols last" data-cols="640" id="mode640X" href="#">640×</td><td class="empty"></td></tr>' +
	       '</table><div class="caption">Mode demonstrations for most of the ' +
               'available VDU modes (some exotic variations are excluded). Click ' + 
	       'on a horizontal or vertical resolution to display an example of it.</div>'
	      );

    var modeInfo = $('#modeDemo .info');

    function updateImage()
    {
	var w = $('#modeDemo .cols.active:first').attr('data-cols');
	var h = $('#modeDemo .rows.active:first').attr('data-rows');
	var imageId = 'mode' + w + 'x' + h;
	console.log('selecting ' + imageId);
	// Show the selected image
	$('#modeDemo #' + imageId).addClass('active').show();
	// Hide the others
	$('#modeDemo img:not(#' + imageId + ')').each(function(i, el){
	    if ($(el).attr('id') == imageId) $(el).show();
	    else $(el).hide().removeClass('active');
	    modeInfo.html(w + '×' + h + ' ' + modeDescr[w] + (w <= 80 && h < 240 ? ' (with halftones)' : ''));
	});
    }
    
    $('#modeSample img:first').show().addClass('active');
    $('#modeDemo td a.rows').click(function(ev){
	ev.preventDefault();
	$('#modeDemo td a.rows').removeClass('active');
	$(this).addClass('active');
	updateImage();
	return 0;
    });
    $('#modeDemo td a.cols').click(function(ev){
	ev.preventDefault();
	$('#modeDemo td a.cols').removeClass('active');
	$(this).addClass('active');
	updateImage();
	return 0;
    });
}

// End of file.
