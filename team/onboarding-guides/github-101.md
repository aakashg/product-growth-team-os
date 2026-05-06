# GitHub 101 for Non-Technical Team Members

You don't need to know how to code. You need 5 commands. Hannah Stulberg's strategy partner at DoorDash went from never having opened GitHub to putting up PRs every day using exactly what's below. The barrier is psychological, not technical.

## What These Words Mean

Read this once. You'll absorb the rest with practice.

| Word | What it means |
|------|---------------|
| **Git** | A tool that tracks every change to a folder, like Google Docs version history but for any kind of file. Runs on your laptop. |
| **GitHub** | A website that hosts copies of those folders so your team shares one source of truth. |
| **Repo** (short for repository) | One folder of files and its full history. The Team OS is one repo. |
| **Clone** | Download a copy of the repo to your laptop. You do this once. |
| **Branch** | Your private workspace inside the repo. You make changes here without affecting anyone else's copy. |
| **Commit** | A single saved change. Like pressing Save in Google Docs but with a short note explaining what you changed. |
| **Push** | Upload your commits from your laptop to GitHub. |
| **Pull** | Download other people's commits from GitHub to your laptop. |
| **PR** (Pull Request) | A button on GitHub that says *"please review my branch and merge it into the main repo."* Your teammate reviews, approves, and clicks Merge. Then your changes are live for the whole team. |
| **Main** | The "official" branch of the repo — what everyone sees by default. You never push directly to main. You always go via a branch + PR. |

## The Easiest Path: Skip the Terminal Entirely

If your PM uses Claude Code, you can hand off the command-running:

1. Take notes from your meeting
2. Paste them into Slack or email and send to your PM
3. Your PM runs `/customer-call` (or similar), which produces the summary file and puts up a PR with you listed as the contributor in the PR description
4. You get tagged on the PR. Click **Approve**. Done.

This is a totally legitimate way to use the Team OS. Many non-technical contributors stay on this path forever and the team works fine.

If you want to go further, install Claude Code yourself ([claude.com/code](https://claude.com/code), guided installer). Once installed, you can ask Claude in plain English — *"create a customer call summary from these notes and put up a PR for Sam to review"* — and it runs all the git commands below for you. **You will not see a terminal.**

The five commands below exist for the case where you want to learn directly, or where Claude Code isn't available.

## Setup (One Time, ~10 minutes)

### Step 1: Create a GitHub account

Go to [github.com](https://github.com) and sign up. Free plan is fine.

### Step 2: Install Git

- **Mac:** Open Terminal (Spotlight → "Terminal"). Paste `xcode-select --install` and press Enter. A popup will appear — click Install. Wait 5 minutes.
- **Windows:** Download the installer from [git-scm.com](https://git-scm.com). Click through every screen using the default settings.
- **Linux:** `sudo apt install git` or `sudo yum install git`.

You will not see a confirmation when it's done. Move on to Step 3.

### Step 3: Clone the repo

Your PM gives you a URL like `https://github.com/your-org/team-os.git`. In your Terminal, paste these two lines (replace the URL):

```
git clone https://github.com/your-org/team-os.git
cd team-os
```

If you see *"Authentication required"*, GitHub wants a Personal Access Token (PAT) instead of a password:

1. On github.com: profile picture → **Settings** → **Developer Settings** (very bottom of the left menu) → **Personal Access Tokens** → **Tokens (classic)** → **Generate new token (classic)**
2. Note: any name you want. Expiration: 90 days. Scopes: tick **repo**.
3. Generate. **Copy the long string immediately** — you can only see it once.
4. Run `git clone` again. When asked for password, paste the token.

If you see *"Permission denied (publickey)"*, you're using the SSH URL. Use the HTTPS URL (starts with `https://`), not the one starting with `git@`.

## The 5 Commands

### 1. Get the latest version (run every morning)

```
git pull
```

Downloads everyone else's changes. Always do this before starting new work.

### 2. Create a branch for your work

```
git checkout -b your-name/what-youre-adding
```

Example: `git checkout -b casey/acme-call-summary`

A branch is your private workspace. Changes don't affect anyone else until you push and put up a PR.

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

First time on a new branch, Git might say *"the current branch has no upstream branch"* and tell you exactly what longer command to run. Copy-paste exactly what Git tells you.

### 5. Open a Pull Request

Open your repo on github.com. You'll see a yellow banner: *"your-branch had recent pushes."* Click **Compare & pull request**. Write a one-line description. Tag a reviewer. Click **Create pull request**.

When the reviewer approves, click **Merge pull request**. Done.

## Common Problems

| Problem | Fix |
|---------|-----|
| *"Your branch is behind main"* | Run `git pull` then try again. |
| *"Merge conflict"* | Two people edited the same file. Ask your eng lead for help the first time — they'll walk you through it. |
| *"I accidentally committed to main"* | Ask your eng lead. This is why we set up branch protection (see root CLAUDE.md). |
| *"I don't know which folder my file goes in"* | Check the **Doc Index** in root CLAUDE.md and the **Where Different Roles Check In Work** table. Or ask Claude in plain English. |
| *"It's asking me to authenticate every time"* | Run `git config --global credential.helper store` (saves your credentials so you don't have to re-enter them). |

## That's It

**Pull. Branch. Commit. Push. PR.**

Once you've done it twice, it's muscle memory. The first time is the hardest. Pair with a teammate for the first PR — every team has someone who'd happily walk you through it.
