# FROM PHONE TO CODESPACE — VM SPIN-UP GUIDE
# STATUS: The GitHub repo is ALREADY created, connected, and pushed.
#   Repo: frankelisjesse-byte/noah0118 (private), auth = SSH (working).
# So steps 1-2 (create repo / first push) are DONE. Skip to step 3.
# The phone syncs to GitHub with a plain `git push` any time (see bottom).

=================================================================
0) YOUR BUILD IS SAFE — already backed up
=================================================================
Everything in ~/ai_influencer/ (81 files) is committed and pushed to the
private repo. If the phone dies, the whole business is recoverable from
GitHub. You don't need to re-do any GitHub setup.

=================================================================
3) CREATE THE CODESPACE FROM THE REPO  (this is where you start)
=================================================================
github.com → avatar (top right) → Your codespaces → New codespace
- Repository: frankelisjesse-byte/noah0118
- Machine: 2-core (free tier)
- Create. VS Code + a terminal open in the browser.
(Free tier = 60 core-hours/mo on 2-core = ~120 hrs. Plenty. STOP the
codespace when done so you don't burn hours: Codespaces page → ... → Stop.)

=================================================================
4) PASTE THE BOOTSTRAP (one line, in the Codespace terminal)
=================================================================
bash ~/ai_influencer/bootstrap_codespace.sh
~10 min. Installs Hermes, confirms the build is present, runs `hermes setup`.
(If the file isn't there, the repo cloned to a different path — run:
   bash $(find / -name bootstrap_codespace.sh 2>/dev/null | head -1) )

=================================================================
5) GO — browser + web_search are LIVE on the VM
=================================================================
In the Codespace terminal: run `hermes`, open a chat, say:
  read ~/ai_influencer/CONTINUITY.md and continue — working browser now
Now UNLOCKED (all dead on the phone):
  - IRS.gov / VITA verify of all Tax Crusher [VERIFY] figures
  - YouTube fddhXXIjB6w transcript pull (agent-commerce clip)
  - LIVE performer research (nova_live_research_runbook.md)
  - MASTER_PLAYBOOK.md [VERIFY] numbers

=================================================================
KEEPING PHONE <-> GITHUB IN SYNC (do this anytime)
=================================================================
On the PHONE (Termux), after any build session:
  cd ~/ai_influencer && git add -A && git commit -m "session update" && git push
On the CODESPACE, to pull the phone's latest before working:
  cd ~/ai_influencer && git pull
And after working on the codespace, push back so the phone can pull:
  cd ~/ai_influencer && git add -A && git commit -m "vm update" && git push
This keeps ONE source of truth on GitHub. Always pull before, push after.
