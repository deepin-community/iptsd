#!/usr/bin/env python3
import argparse
import os
from pathlib import Path

blacklist = ['.git', '.github', '.gitignore', '.gitmodules', '.obs']
_filter = lambda x: x.name not in blacklist

def main(src, dst='.'):
  for child in filter( _filter, Path(src).iterdir() ):
    os.system(f'ln -sf {child} {dst}/{child.name}')

if __name__=='__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('src')
  parser.add_argument('dst', default='.', nargs='?')
  args = parser.parse_args()

  main(src=args.src, dst=args.dst)
