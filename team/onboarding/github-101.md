# GitHub 101 for Non-Technical Team Members

GitHub is where the Team OS lives. Think of it as Google Docs for structured files, with version history and review built in. You don't need to know how to code. You need 5 commands.

## Setup (One Time, ~10 minutes)

### Step 1: Create a GitHub account
Go to github.com and sign up. Free plan is fine.

### Step 2: Install Git
- **Mac:** Open Terminal (search "Terminal" in Spotlight). Type: `xcode-select --install` and follow the prompts.
- **Windows:** Download from git-scm.com. Use all the default settings during install.
- **Linux:** `sudo apt install git` or `sudo yum install git`

### Step 3: Clone the repo

Your PM will give you a URL that looks like: `https://github.com/[org]/[repo-name].git`

Open your terminal and type:
```
git clone https://github.com/[org]/[repo-name].git
cd [repo-name]
```

**If this fails with "Authentication required":** GitHub now requires a personal access token instead of a password.
1. Go to github.com > Settings > Developer Settings > Personal Access Tokens > Tokens (classic)
2. Generate a new token with "repo" scope
3. When git asks for your password, paste the token instead

**If you see "Permission denied (publickey)":** You're using SSH instead of HTTPS. Use the HTTPS URL (starts with https://) not the SSH URL (starts with git@).

## The 5 Commands

### 1. Get the latest version (run every morning)
```
git pull
```
This downloads everyone else's changes. Always do this before starting work.

### 2. Create a branch for your work
```
git checkout -b [your-name]/[what-youre-adding]
```
Example: `git checkout -b casey/acme-call-summary`

A branch is your workspace. It keeps your changes separate until they're reviewed.

### 3. Save your work
```
git add .
git commit -m "Added Acme Corp call summary from 2026-04-28"
```
The message in quotes describes what you changed. Keep it short and clear.

### 4. Push your work to GitHub
```
git push
```
First time on a new branch, Git might ask you to run a longer command. It will tell you exactly what to type. Just copy and paste it.

### 5. Open a Pull Request
Go to your repo on github.com. You'll see a yellow banner saying "[your branch] had recent pushes." Click "Compare & pull request." Add a short description. Tag a reviewer. Click "Create pull request."

When the reviewer approves, click "Merge pull request." Done.

## If You Use Claude Code

Claude Code handles most of this for you. Tell it:
"Put up a PR for [teammate name] to review this customer summary"

It runs the git commands, creates the PR, and tags the reviewer. You just approve.

## Common Problems

**"Your branch is behind main"** — Run `git pull` then try again.

**"Merge conflict"** — Two people edited the same file. Ask your eng lead for help the first time. After that you'll know the drill.

**"I accidentally committed to main"** — Ask your eng lead. This is why branch protection exists (see root CLAUDE.md).

**"I don't know which folder to put my file in"** — Check the root CLAUDE.md's doc index and the "Where Different Roles Check In Work" table.

**"It's asking me to authenticate every time"** — Run: `git config --global credential.helper store` (saves your credentials so you don't have to re-enter them).

## That's It

Pull. Branch. Commit. Push. PR.

Hannah Stulberg's strategy partner at DoorDash went from never having opened GitHub to putting up PRs every day using these same commands. The barrier is psychological, not technical. Once you've done it twice, it's muscle memory.
