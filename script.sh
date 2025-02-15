#!/bin/bash
# A bash script used to add files to git staging area, commit and push to a remote repository

# -------------------------------
# Step 1: validate git repository
# -------------------------------

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: Not a git repository."
  exit 1
fi

# ---------------------
# Step 2: git add files
# ---------------------
#Check for staged files/read files
if ! git diff --cached --quiet; then
    echo "Found staged files, skipping 'git add' and proceeding to commit."
else
    read -rp "Enter the files to git add: " -a files_to_add

    #validate input 
    if [[ ${#files_to_add[@]} -eq 0 ]]; then
        echo "Error: please enter at least one argument."
        exit 1
    fi

    git add "${files_to_add[@]}" || exit 1

#verify files were staged
    if git diff --cached --quiet; then
        echo "Error: No files were staged, exiting..."
        exit 1
    fi
fi

# ------------------
# Step 3: git commit
# -------------------
#commit staged files
while true; do
    read -rp "git commit message: " commit
    #check for empty commit message
    if [[ -z "$commit" ]]; then
        echo "Error: You must provide a commit message."
    else
        if git commit -m "$commit"; then
            break # success: exit loop
        else
            echo "Commit failed, please fix the issue and try again."
        fi
    fi
done

# ------------------
# Step 4: git push
# -------------------
#check if upstream is set
if ! git rev-parse --abbrev-ref --symbolic-full-name "@{u}" > /dev/null 2>&1; then
    echo "Error: No upstream branch is set. Setting upstream branch..."
    git push -u origin "$(git branch --show-current)" || exit 1
else
#check for unpushed commits
    if git log --oneline "@{u}..HEAD" | grep -q . ; then
        echo "Found unpushed commits, pushing now..."
        while true; do
            if git push; then
                break
            else
                echo "Push failed, please fix the issue and try again."
                # read new input and retry git push
                read -rp "Press Enter to retry..."
            fi
        done
    else
        echo "No new commits found to push, exiting..."
    fi
fi
