"""
SRC                     -> DST
/home/daniel/.gitconfig -> /home/daniel/dotfiles/gitconfig
"""
from pathlib import Path

SKIP_LIST = ['Makefile', 'README.md', 'run.py', '.git', '.gitignore']


if __name__ == '__main__':
    for dst_path in Path('.').iterdir():
        dst_path = dst_path.absolute()
        if dst_path.name in SKIP_LIST:
            continue

        src_path = Path.home() / ('.' + dst_path.name)
        if src_path.exists():
            if src_path.resolve() != dst_path:
                print(f'Skipping {dst_path.name} because it already exists, will not overwrite')
            else:
                print(f'{dst_path.name} already linked')
            continue

        print(f'Linking {dst_path.name}')
        src_path.symlink_to(dst_path)
