#!/usr/bin/python

print "GIMP Palette"
print "Name: CFT 64 colours"

for g in [0, 0x55, 0xaa, 0xff]:
    for b in [0, 0x55, 0xaa, 0xff]:
        for r in [0, 0x55, 0xaa, 0xff]:
            print "%3d %3d %3d" % (r, g, b)

# End of file.
