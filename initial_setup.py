#!/usr/bin/env python3

import subprocess
import os

def run_command(command):
    subprocess.run(command, shell=True)

def clone_dotfiles():
    dotfiles_repo_url = 'git@github.com:0xdeadd/dotfiles.git' # replace with your repository
    run_command(f'git clone {dotfiles_repo_url} ~/dotfiles')

def symlink_dotfiles():
    # Symlink the dotfiles to home directory
    for filename in os.listdir('~/dotfiles'):
        if filename.startswith('.'):
            run_command(f'ln -s ~/dotfiles/{filename} ~/{filename}')

def install_packages():
    # This would depend on the package manager used by the distribution
    packages = ['vim', 'git', 'tmux', 'zsh']
    run_command('sudo pacman -S ' + ' '.join(packages))

def apply_customizations():
    # Place additional customizations here, such as installing plugins, themes, etc.
    run_command('sh ~/dotfiles/setup_zsh.sh')

if __name__ == "__main__":
    clone_dotfiles()
    symlink_dotfiles()
    install_packages()
    apply_customizations()

