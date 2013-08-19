#!/usr/bin/python

import sys, subprocess, re, os, array, random

random.seed(207205965) 

def main():
    
    try:
        res, fname = sys.argv[1:3]
        mode = re.match('((((40|80|160)x(30|60|120|240|480)MC)|' + 
                        '((160|320|640)x(30|60|120|240|480)HGR)))', res)
        assert mode
        
    except ValueError:
        sys.stderr.write('Syntax: %s MODE FILE\n\n' % sys.argv[0])
        sys.stderr.write('MODE is (40|80|160)x(30|60|120|240|480)MC or \n')
        sys.stderr.write('        (160|320|640)x(30|60|120|240|480)HGR\n\n')
    
    try:
        open(fname)
    except IOError, e:
        sys.stderr.write('%s: %s\n' % (sys.argv[0], str(e)))
        sys.exit(1)
    
    x = re.findall('(\d+)x(\d+)(HGR|MC)', res)
    w, h, d = x[0]
    w = int(w)
    h = int(h)
    mc = d.upper() == 'MC'
    #print w, h, d, mc
    clh = 400 // h
    # 1 1 2 
    if mc:
        group = {40:1, 80:1, 160:2, 320:2, 640:8}[w]
    else:
        group = {160:2, 320:4, 640:8}[w]
    #print w, group
    
    header, data = subprocess.check_output(["convert", fname,
                                            "-dither", "FloydSteinberg",
                                            "-scale", "%dx%d!" % (w, h),
                                            "-depth", "2",
                                            #"-scale", "640x400!",
                                            "pam:-"])\
                                            .split('ENDHDR\n')
    
    assert len(data) == 3 * w * h
    
    # RGB triplets to colour numbers
    data0 = array.array('B')
    data0.fromstring(data)
    data1 = array.array('B')
    data2 = array.array('B')
    for x in xrange(w * h):
        c = data0[x*3] | (data0[x*3+1] << 2) | (data0[x*3+2] << 4)
        assert c in xrange(64)
        data1.append(c)
    
    assert len(data1) == w * h
    assert (len(data1) % group) == 0
    
    def histogram(x):
        h = dict()
        for val in x:
            try:
                h[val] += 1
            except KeyError:
                h[val] = 1
        return h
    
    if not mc:
        # Now process groups of group x 1 pixels
        for x in xrange(0, w * h, group):
            colgroup = data1[x: x + group]
            assert len(colgroup) == group
            hist = histogram(colgroup)
            numc = len(hist)
            if numc == 1:
                fg = bg = hist.keys()[0]
            elif numc == 2:
                fg, bg = hist.keys()
            else:
                items = hist.items()
                random.shuffle(items)
                items.sort(cmp=lambda a, b: cmp(b[1], a[1]))
                fg, bg = items[0][0], items[1][0]

            cg1 = [{True: bg, False: fg}[x == bg] for x in colgroup]
            assert len(set(cg1)) < 3
            data2.fromlist(cg1)
    else:
        data2 = data1

    # And write the output.
    x = os.path.splitext(fname)
    out_fname = '%s-%dx%d%s.png' % (x[0], w, h, d)
    pipe = subprocess.Popen(["convert",
                             "pam:-",
                             "-scale", "640x400!",
                             "-depth", "2",
                             out_fname,
                             ], stdin=subprocess.PIPE).stdin
    pipe.write(header + "ENDHDR\n")
    for x in data2:
        r = chr(x & 3)
        g = chr((x >> 2) & 3)
        b = chr((x >> 4) & 3)
        pipe.write('%c%c%c' % (r, g, b))
    pipe.close()
    


if __name__ == '__main__':
    main()        
    
# End of file.
