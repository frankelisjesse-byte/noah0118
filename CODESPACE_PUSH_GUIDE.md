# FROM PHONE TO CODESPACE — PUSH GUIDE (user does this part)
# The build is committed + a one-paste bootstrap is in the repo. You do the GitHub
# login + push + create-codespace. Nothing here is irreversible.

=================================================================
1) CREATE A PRIVATE GITHUB REPO (phone browser)
=================================================================
github.com → "+" (top right) → New repository
- name: nova-build   (or anything)
- PRIVATE (keep the build off public)
- DO NOT add README/LICENSE (we already have files)
- Create repository

=================================================================
2) PUSH THE BUILD (from Termux on the phone — already committed locally)
=================================================================
cd ~/ai_influencer
git branch -M main
git remote add origin git@github.com:<YOUR_USER>/nova-build.git
git push -u origin main
(auth: GitHub may prompt for username + token. Use a fine-grained PAT with
 repo write access — NOT your account password. Generate at github.com →
 Settings → Developer settings → Personal access tokens.)

=================================================================
3) CREATE THE CODESPACE FROM THAT REPO
=================================================================
github.com → avatar → Your codespaces → New codespace
- Repository: pick nova-build
- Machine: 2-core (free)
- Create. VS Code + terminal open in the browser.

=================================================================
4) PASTE THE BOOTSTRAP (one block)
=================================================================
bash ~/ai_influencer/bootstrap_codespace.sh
~10 min. It installs Hermes, confirms the build is present, runs `hermes setup`.

=================================================================
5) GO
=================================================================
In the Codespace terminal: run `hermes`, open a chat, say:
  read ~/ai_influencer/CONTINUITY.md and continue — working browser now
Browser + web_search live. IRS.gov verify, YouTube transcript, NOVA LoRA — all unlocked.

=================================================================
ALT: BLANK CODESPACE + CLONE
=================================================================
If you'd rather not create-from-repo, make a blank codespace, then in its terminal:
  export REPO_URL="git@github.com:<YOUR_USER>/nova-build.git"
  bash <(curl -fsSL raw.githubusercontent.com/<YOUR_USER>/nova-build/main/bootstrap_codespace.sh)
(needs the repo public OR you've added the codespace's SSH key to GitHub.)
