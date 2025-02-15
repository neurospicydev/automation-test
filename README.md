# Git Workflow Automation

A bash script used to add files to git staging area, commit and push to a remote repository

## Description

This bash script simplifies git workflow by automating staging, committing, and pushing changes. It includes user-friendly prompts, and error handling to demonstrate knowledge and understanding in:  
- **Bash scripting**  
- **Git operations**  
- **User input validation**  
- **Error handling and automation**  

## Key Features  

- **Git Repository Validation**  
  - Ensures the script runs only in a valid git repo.  

- **Smart Staging**  
  - Skips `git add` if files are already staged, saving time and effort.  

- **Input Validation**  
  - Enforces non-empty commit messages and file arguments.  

- **Upstream Branch Check**  
  - Checks for upstream branch and sets up tracking if missing, ensuring smooth `git push` operations.
  - Auto-sets upstream branch on first push.  

- **Retry Logic**  
  - **Commit**: Loops until the user fixes issues (empty message, conflicts, etc.).  
  - **Push**: Retries automatically after transient errors (network issues), allowing quick recovery. 

- **Cross-Platform**: Works on Linux, macOS, and Windows (via WSL).

## What to Test  

- **Edge Cases**  
  - Run the script outside a git repo.  
  - Provide no files during `git add`.  
  - Leave the commit message empty.  

- **Error Recovery**  
  - Simulate a failed `git push` (e.g., disconnect from the internet, then reconnect).  
  - Trigger a `git commit` failure (e.g., use a pre-commit hook that rejects the commit).  

- **Resume Functionality**  
  - Stage files, then rerun the script to skip `git add`.  
  - Create unpushed commits, then rerun to push them first.  

## Upcoming Features

- **Interactive Staging**: Choose to add or decline adding more files to the staging area.
- **Custom Upstream Branch Support**  
  - Allow users the option to specify a non-default upstream branch (e.g., `origin/dev`).  
- **Diff Preview Before Commit**  
  - Show `git diff --staged` output to let users review changes before committing. 

## Installation  
1. Clone this repository:  
   ```bash  
   git clone https://github.com/yourusername/git-automation-script.git
   ```
 
2. Make the script executable:
   ```bash
   cd git-automation-script
   chmod +x script.sh
   ```

3. Run the script:
   ```bash
   ./script.sh
   ```

4. Example workflow:
    ```bash
    automation-test$ ./script.sh
    git commit message: Initial commit
    [main (root-commit) c280d6a] Initial commit
    1 file changed, 3 insertions(+)
    create mode 100644 .gitignore
    No upstream branch is set. Setting upstream branch...
    Enumerating objects: 3, done.
    Counting objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 265 bytes | 265.00 KiB/s, done.
    Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
    To https://github.com/neurospicydev/automation-test.git
    * [new branch]      main -> main
    branch 'main' set up to track 'origin/main'.

   ```

## 🤝 Contributing  
Open to contributions! Follow these steps:  
1. Fork the repository.  
2. Create a feature branch:  
   ```bash  
   git checkout -b feature/new-feature
   ```
3. Commit changes:
   ```bash
   git commit -m "Add new feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/new-feature
   ```
5. Open a pull request.

## License  
This project is licensed under the [MIT License](LICENSE).
