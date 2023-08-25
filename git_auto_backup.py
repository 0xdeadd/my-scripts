#!/usr/bin/env python3

import os

os.environ['GIT_SSH_COMMAND'] = 'ssh -i /home/cleve/.ssh/id_rsa'

def git_commit_push(repo_path, commit_message):
    status_output = os.popen(f"git -C {repo_path} status --porcelain").read()
    if status_output:
        os.system(f"git -C {repo_path} add .")
        os.system(f"git -C {repo_path} commit -m '{commit_message}'")
        os.system(f"git -C {repo_path} push origin main")
    else:
        print(f"No changes in {repo_path}")

def main():
    repositories = [
        {"path": "/home/cleve/projects/obsidian", "commit_message": "Automated Obsidian commit"},
        {"path": "/home/cleve/dotfiles", "commit_message": "Automated dotfiles commit"},
        # Add more repositories as needed
    ]

    for repo in repositories:
        git_commit_push(repo['path'], repo['commit_message'])

if __name__ == "__main__":
    main()

