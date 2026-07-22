# HERMES ON A $0 VM — COPY-PASTE SETUP (working browser + web_search)
# Two $0 routes. Pick ONE. Both give Hermes a real Linux env where Node + Chromium
# + firecrawl work, unblocking the browser tool and live web research.
# Run these from the VM's terminal (not Termux). ~10 min first time.

=================================================================
ROUTE 1 — GITHUB CODESPACE (easiest, $0, browser-backed terminal on phone)
=================================================================
No credit card usually needed if you have GitHub. Runs in the browser — you can
drive it from the phone's real browser.
1. Go to github.com → your avatar → "Your codespaces" (or github.com/codespaces).
2. "New codespace" → pick any repo (or "Skip to create from blank" / use a dummy
   repo). Choose a machine type: "2-core" (free tier) is enough.
3. Wait ~30s for it to boot. You get a VS Code terminal IN THE BROWSER.
4. In that terminal, paste THIS block:
-----------------------------------------------------------------
# install Hermes deps (Ubuntu base in codespace)
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip python3-venv nodejs npm git curl
# (nodejs from apt is v18-20 here — NOT the broken Android build, works fine)
node --version   # should print v18/v20, no V8 crash
# install Hermes per its docs (replace with the real install command from
# hermes docs / hermes setup). Generic shape:
pip3 install --upgrade pip
# >>> PASTE THE ACTUAL HERMES INSTALL COMMAND HERE <<<
# e.g.  pipx install hermes-agent   (or however the docs say)
hermes setup      # walks through browser + web_search config
-----------------------------------------------------------------
5. After hermes setup, the browser tool + web_search WORK. Open a new chat turn and
   the browser navigates for real.
NOTE: Codespaces auto-pause after inactivity (free tier ~15-30 min idle = $0 still,
  just re-open). Your files persist in the workspace.

=================================================================
ROUTE 2 — ORACLE CLOUD FREE TIER (always-free, $0 forever, more permanent)
=================================================================
Needs a card on file for identity (not charged — free tier is $0). Gives a real
always-on VM you can SSH to from the phone (Termux ssh/mosh).
1. Sign up cloud.oracle.com → "Create a VM instance" → shape:
   "Always Free" → Ampere A1 (ARM) 1-2 OCPU / 1-4 GB RAM, Ubuntu 22.04.
2. Add your SSH public key (generate in Termux: `ssh-keygen -t ed25519`, paste
   ~/.ssh/id_ed25519.pub into the Oracle form).
3. After it provisions, from Termux on the phone: `ssh ubuntu@<VM-IP>`.
4. In the VM terminal, paste THIS block:
-----------------------------------------------------------------
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip python3-venv nodejs npm git curl
node --version   # v18/v20, no Android V8 crash
# install Hermes per docs:
pip3 install --upgrade pip
# >>> PASTE THE ACTUAL HERMES INSTALL COMMAND HERE <<<
hermes setup
-----------------------------------------------------------------
5. Browser + web_search work. To drive from the phone comfortably, install mosh
   on the VM (`sudo apt-get install -y mosh`) and use a mosh client in Termux, or
   just plain `ssh` — the VM runs 24/7 free.
NOTE: ARM (Ampere) — Hermes + Node run fine on ARM Linux. If a package balks at
  ARM, switch the shape to an AMD free-tier instance instead.

=================================================================
WHY THIS FIXES IT (the actual reason)
=================================================================
- The crash was Android's bionic linker / V8-on-Android. A real Linux VM uses
  glibc + a proper V8 build → node runs, chromium runs, firecrawl compiles.
- Node from apt on Ubuntu is v18/v20 — completely different from the broken Termux
  node 24/26. No "AllowHeapAllocationInRelease" fatal.
- This is the same conclusion path_b_browser_setup.md reached: device-level wall,
  VM is the only real fix. These are the cheapest ($0) ways to get there.

=================================================================
AFTER IT WORKS — BRING THE BUILD OVER
=================================================================
- The 43 files in ~/ai_influencer/ are plain text. Copy them to the VM
  (git push/pull, or `scp -r ~/ai_influencer ubuntu@<VM>:~/` from Termux).
- Everything travels. The suspense campaign, Tax Crusher course, captions — all of it.
- Then i can verify the tax law LIVE (IRS.gov) and even render heat visuals locally
  if you install an SDXL backend on the VM.

=================================================================
CHEAT SHEET (what to paste where)
=================================================================
Codespaces: open codespace terminal → paste Route 1 block.
Oracle: ssh in → paste Route 2 block.
Both: replace the HERMES INSTALL line with the command from Hermes docs, then
  `hermes setup`. Done — browser + web_search live.
