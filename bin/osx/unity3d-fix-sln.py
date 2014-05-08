#!/usr/bin/env python

import os
import sys
import argparse
import glob
from threading import Timer

from blessings import Terminal

term = Terminal()

test_mode = False
verbose_mode = False
watch_delay = 5

def info(msg):
    print term.normal + msg

def verbose(msg):
    if verbose_mode:
        info(msg)

def error(msg):
    print term.red + msg

def format_error(err):
    return term.red(err)

def format_path(path):
    return term.blue(path)

def format_param(param):
    return term.yellow(param)

START_TAG = 'GlobalSection(MonoDevelopProperties) = preSolution'
END_TAG = 'EndGlobalSection'

def fix_sln(path):
    if not os.path.isfile(path):
        error('File Not Exist: ' + format_path(path))
        return
    else:
        verbose('Processing File: ' + format_path(path))

    lines = open(path).readlines()
    tmp_path = path + '.tmp'
    output = open(tmp_path, 'w')

    def write_line(line):
        output.write('%s' % line)

    def comment_line(line):
        if line.startswith('#'):
            output.write('%s' % line)
            return 0
        else:
            output.write('# %s' % line)
            return 1

    changed_lines = 0
    start_tag_found = False
    end_tag_found = False
    for line in lines:
        if end_tag_found:
            write_line(line)
        elif start_tag_found:
            changed_lines = changed_lines + comment_line(line)
            if line.find(END_TAG) >= 0:
                end_tag_found = True
        elif line.find(START_TAG) >= 0:
            start_tag_found = True
            changed_lines = changed_lines + comment_line(line)
        else:
            write_line(line)
    output.close()
    if changed_lines > 0:
        verbose('Changed Line Number: ' + format_param('%s' % changed_lines))
        os.system('cp %s %s' % (tmp_path, path))
    else:
        verbose('No Need to Change: ' + format_path(path))
    os.system('rm %s' % tmp_path)

def fix_all():
    for f in glob.glob('*.sln'):
        fix_sln(f)

def watch_stdin():
    while True:
        try:
            line = sys.stdin.readline()
        except KeyboardInterrupt:
            break
        if not line:
            break
        path = line.replace('\n', '').strip()
        verbose('Delay Processing: ' + format_param('%s Seconds -> ' % watch_delay) + format_path(path))
        t = Timer(watch_delay, fix_sln, (path, ))
        t.start()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--verbose', action='store_true')
    parser.add_argument('-t', '--test', action='store_true', help='Test Only, Not Overriding Original Files')
    parser.add_argument('-w', '--watch', action='store_true', help='Watch Mode, Working with fsw')
    parser.add_argument('-a', '--all', action='store_true', help='Processing All Files in The Current Project')
    parser.add_argument('file', nargs='*')

    args = parser.parse_args()
    global test_mode
    test_mode = args.test
    global verbose_mode
    verbose_mode = args.verbose

    if args.watch:
        watch_stdin()
    elif args.all:
        fix_all()
    elif args.file:
        for path in args.file:
            fix_sln(path)
    else:
        info('Please provide the files to process, or use "--all" to process all files')
        sys.exit(1)

if __name__ == '__main__':
    main()
