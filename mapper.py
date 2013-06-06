#!/usr/bin/env python
import sys
import re

for line in sys.stdin:
    # remove non alpha-numeric
    line = re.sub("[^a-zA-Z0-9]", " ", line)
    line = line.strip().lower()
    # split the line into words
    words = line.split()
    for word in words:
        # tab-delimited; this word happened 1 times
        print '%s\t%s' % (word, 1)
