#!/usr/bin/python
# encoding: utf-8

import sys

XRES = 640
YRES = 400

CELLS = ((8, 16), (8, 8),       # Text modes.
         (1, 1),                # PEL blocks.
         (2, 1),                # x2 graphics blocks (4)
         (4, 1),                # x4 graphics blocks (16)
         (8, 1),                # x8 graphics blocks (256)
         )

"""

      Text       Text
      8x16       8x8        1x1        2x1        4x1        8x1
___1__........___........___########___####....___##......___#.......
___2__........___........___########___####....___##......___#.......
      ........   ........   ########   ####....   ##......   #.......
___4__........___........___########___####....___##......___#.......
      ........   ........   ########   ####....   ##......   #.......
      ........   ........   ########   ####....   ##......   #.......
      ........   ........   ########   ####....   ##......   #.......
___8__........___........___########___####....___##......___#.......
      ........              ########   ####....   ##......   #.......
      ........              ########   ####....   ##......   #.......
      ........              ########   ####....   ##......   #.......
      ........              ########   ####....   ##......   #.......
      ........              ########   ####....   ##......   #.......
      ........              ########   ####....   ##......   #.......
      ........              ########   ####....   ##......   #.......
__16__........______________########___####....___##......___#.......


"""



class Disposition(object):
    def __init__(self, col, clh, cell):
        self.col = col
        self.clh = clh
        self.cell = cell
        self.w = self.col * self.cell[0]
        self.h = YRES // (self.clh * self.cell[1])

    @property
    def ratio(self):
        return float(self.w) / self.h

    def name(self):
        return '%d×%d' % (self.w, self.h)

    def possible(self):
        return True

    def practical(self):
        return self.ratio >= 0.8 and self.ratio <= 3.2

    def square(self):
        return self.ratio == 640./400.

    def shape(self):
        if self.ratio == 640./400.:
            return r'square'
        if self.ratio < 640./400.:
            return r'fat'
        return r'thin'

    def notes(self):
        return '?'



class TextMode16(Disposition):
    order = 'A'
    colour=32
    def __init__(self, *args):
        Disposition.__init__(self, *args)
        self.w = col
        self.h = YRES // self.clh

    def possible(self):
        return Disposition.possible(self) and self.clh == 16 and \
            self.cell == (8, 16)

    def name(self):
        cols = self.col
        return '%d×%d Text' % (cols, YRES // self.clh)

    def notes(self):
        return '16 row font.'



class TextMode8(TextMode16):
    order = 'B'
    colour=33
    def possible(self):
        return Disposition.possible(self) and self.clh in [8, 16] and \
            self.cell == (8, 8)

    def notes(self):
        if self.clh == 8:
            return '8 row font.'
        elif self.clh == 16:
            return '8 row font in 16 row character cell.'
        else:
            return Disposition.notes(self)



class HighResGraphics(Disposition):
    order = 'Z'
    colour = 36
    def __init__(self, *args):
        Disposition.__init__(self, *args)
        self.w = self.col * 8 * self.cell[0]
        self.h = YRES // clh

    def possible(self):
        return Disposition.possible(self) and self.cell == (1, 1)

    def name(self):
        return Disposition.name(self) + ' Graphics'

    def notes(self):
        return '2 colours per %d×1 pixels.' % (8 // cell[0], )



class SemiGraphics(Disposition):
    order = 'G'
    def __init__(self, *args):
        Disposition.__init__(self, *args)
        self.w = self.col * self.cell[0]
        self.h = YRES // clh

    def possible(self):
        return Disposition.possible(self) and \
            self.clh > 1 and \
            self.cell[1] == 1 and self.cell[0] > 1 and self.cell[0] < 8

    def name(self):
        return Disposition.name(self) + ' Semigraphics'

    @property
    def colour(self):
        if cell[0] == 2:
            return 35
        else:
            return 31

    def notes(self):
        if cell[0] == 4:
            return 'C-plane. No restrictions.'
        return '2 colours per %d×%d pixels.' % (8/cell[0], 1)



class Multicolour(Disposition):
    order = 'M'
    colour = 34
    def __init__(self, *args):
        Disposition.__init__(self, *args)
        self.w = self.col * self.cell[0]
        self.h = YRES // clh

    def possible(self):
        return Disposition.possible(self) and \
            self.clh > 1 and \
            self.cell[1] == 1 and self.cell[0] == 1

    def name(self):
        return Disposition.name(self) + ' Multicolour'

    def notes(self):
        return 'C-plane. No colour restrictions.'


disps = []
disps.append(TextMode16)
disps.append(TextMode8)
disps.append(HighResGraphics)
disps.append(SemiGraphics)
disps.append(Multicolour)

num, nump, nums = 0, 0, 0
out = ''
data = dict()
data2 = dict()
print "%% Generated automatically by %s, do not edit." % sys.argv[0]
print "%% COL  CLH  CELL  Type              Pract  Px shape  Description"
print "%%", "-"*120
for col in (40, 80):
    for clh in (16, 4, 8, 2, 1):
        for cell in CELLS:
            mode = 'XXXX'
            for disp in disps:
                d = disp(col, clh, cell)
                if not d.possible():
                    continue
                b = "\x1b[0m"
                s = b
                if d.practical():
                    s = "\x1b[1;%dm" % d.colour
                    nump += 1
                if d.square():
                    nums += 1
                notes = d.notes()
                csz = "{%s}{%s}" % (cell[0], clh)
                dispname = d.__class__.__name__
                prac = d.practical() and 'Yes' or 'No'
                dname = d.name()
                dnotes = d.notes()
                psh = d.shape()
                num += 1
                w, h = d.w, d.h
                data2[(d.w * d.h, d.order, num)] = "%% %(s)s%(col)3d %(clh)3d %(csz)7s  %(dispname)-16s  %(prac)-3s  %(psh)10s  %(dname)s. %(dnotes)s%(b)s" % locals()
                prac2 = d.practical() and 'Pract' or 'Impract'
                psh = psh[0].upper() + psh[1:]
                if 'Text' in dispname:
                    data[(d.w * d.h, d.order, num)] = r"\vdumode%(prac2)s%(csz)s{%(dname)s}{%(dnotes)s}" % locals()
                else:
                    data[(d.w * d.h, d.order, num)] = r"\vdumode%(prac2)s%(csz)s{%(dname)s}{%(psh)s pixels. %(dnotes)s}" % locals()

for key in sorted(data.keys()):
    print data2[key]
print "%% \n%% %d modes available, %d practical, %d with square pixels." % (num, nump, nums)

print out
for key in sorted(data.keys()):
    print data[key]

# End of file.
