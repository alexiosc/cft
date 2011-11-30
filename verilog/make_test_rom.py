#!/usr/bin/python

f = open('test_rom.bin', 'w')

text = "Hello, World!"

for i in range(8192):
    try:
        f.write(bin(ord(text[i]))[2:].zfill(8) + '\n')
    except:
        f.write('0000_0000\t// Blank.\n')
