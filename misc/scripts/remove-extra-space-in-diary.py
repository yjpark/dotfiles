#!/usr/bin/env python

import os
import sys
import glob

def info(msg):
    print msg

def info_line():
    info('--------------------------------------------------------------------------')

def execute(cmd):
    info(cmd)
    ret = os.system(cmd)
    if ret != 0:
        info_line()
        info('Failed [%s]: %s' % (ret, cmd))
        sys.exit(ret)

def handle_all():
    for f in glob.glob(os.path.join('*/', '*.md')):
        lines = open(f, 'r').readlines()
        handle_one(f, lines)
    for f in glob.glob(os.path.join('*/*/', '*.md')):
        lines = open(f, 'r').readlines()
        handle_one(f, lines)

def is_time(line):
    return len(line) > 2 and line[0] == '[' and line[-1] == ']'

def process_line(line):
    if is_time(line.strip()):
        return line.replace('[', '### ').replace(']', '')
    return line

def handle_one(path, lines):
    output = open(path + ".new", 'w')
    last_empty = False
    for line in lines:
        if line.strip() == '':
            if last_empty:
                continue
            else:
                last_empty = True
        else:
            last_empty = is_time(line.strip())
        output.write(process_line(line))
    output.close()
    execute('cp %s.new %s ; rm %s.new' % (path, path, path))

def main():
    handle_all()

if __name__ == '__main__':
    main()

