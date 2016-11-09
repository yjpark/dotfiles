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
    for f in glob.glob(os.path.join('.', '*.txt')):
        lines = open(f, 'r').readlines()
        handle_one(lines)

def handle_one(lines):
    title = lines[0]
    title = title.replace('# ', '').replace('\n', '')
    year = title[:4]
    month = title[:7]
    folder = '_out/%s' % year
    if title[4] == '-':
        folder = '%s/%s' % (folder, month)
    execute('mkdir -p %s' % folder)
    path = '%s/%s.md' % (folder, title)
    output = open(path, 'w')
    for line in lines[2:]:
        output.write(line)
    output.close()

def main():
    handle_all()

if __name__ == '__main__':
    main()

