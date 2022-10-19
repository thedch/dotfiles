"""
SRC                     -> DST
/home/daniel/.gitconfig -> /home/daniel/dotfiles/gitconfig
"""
from pathlib import Path

SKIP_LIST = ['Makefile', 'README.md', 'run.py', '.git', '.gitignore']


if __name__ == '__main__':
    for dst_path in Path('.').iterdir():
        if dst_path.name in SKIP_LIST:
            continue

        src_path = Path.home() / ('.' + dst_path.name)
        if src_path.exists():
            print(f'Skipping {dst_path.name}')
            continue

        src_path.symlink_to(dst_path.absolute())
