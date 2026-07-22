# CODES PACES — ONE-SHOT HERMES SETUP (working browser + web_search)
# You picked Codespaces. This is the EXACT block to paste into the Codespace
# terminal. It installs Hermes on real Linux (glibc + working Node) so the browser
# tool + web_search finally work. ~10 min. Read notes below first.

=================================================================
STEP 0 — CREATE THE CODESPACE (browser, on phone)
=================================================================
1. On your phone's real browser: github.com → avatar → "Your codespaces"
   (or go to github.com/codespaces).
2. "New codespace". If prompted for a repo, pick any of yours or a blank one.
3. Machine: choose "2-core" (free tier). Region: nearest you.
4. Click Create. Wait ~30-60s. A VS Code editor WITH A TERMINAL opens in the browser.
5. Click the terminal panel (or Terminal → New Terminal).

=================================================================
STEP 1 — PASTE THIS BLOCK INTO THE CODESPACE TERMINAL
=================================================================
# --- system deps (Ubuntu base) ---
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip python3-venv nodejs npm git curl

# --- confirm Node is the GOOD build (no Android V8 crash here) ---
node --version        # expect v18 or v20, NOT the broken Termux 24/26
npm --version

# --- install Hermes ---
pip3 install --upgrade pip
pip3 install hermes-agent

# --- confirm it's there ---
hermes --version       # should print Hermes Agent vX.X.X

# --- configure tools (this is where browser + web_search get enabled) ---
hermes setup tools     # or just: hermes setup  (full wizard)
# answer the prompts: enable browser, enable web_search/firecrawl if offered.
# if it asks for API keys, paste them when prompted (or set later via hermes secrets).

# --- optional: bring your NOVA build over (from this phone via git or scp) ---
# (see STEP 2) — skip if you'll just start fresh.

echo "DONE — browser + web_search should now work. Open a new chat turn and test."

=================================================================
STEP 2 — BRING THE 43-FILE BUILD OVER (optional but recommended)
=================================================================
The build lives in ~/ai_influencer/ on this phone. To get it into the Codespace:
EASIEST (git): on the phone, in Termux:
  cd ~/ai_influencer && git init -q && git add -A && git commit -qm "nova build"
  # create a private GitHub repo, then:
  git remote add origin git@github.com:<you>/<repo>.git && git push -u origin main
Then in the Codespace terminal:
  git clone git@github.com:<you>/<repo>.git ~/ai_influencer
ALT (scp): from Termux on the phone (needs the codespace's SSH, or use the web UI
  to upload the folder):
  scp -r ~/ai_influencer ubuntu@<codespace-ssh>:~/   # if you enabled SSH in codespace

=================================================================
STEP 3 — TEST THE BROWSER (proof it works)
=================================================================
In the Codespace terminal, start a Hermes chat and ask me to:
  "open example.com in the browser"
If it returns a real page snapshot (not a V8 crash), the wall is broken. Same for:
  "search the web for IRS EITC 2024 maximum"
If that returns live results, web_search is back.

=================================================================
NOTES / GOTCHAS
=================================================================
- Codespaces free tier auto-pauses after ~15-30 min idle. Reopen = $0 still, files
  persist. For always-on, use the Oracle Free Tier route in vm_setup_commands.md.
- The pip package is `hermes-agent` (confirmed the binary is `hermes`). If pip on the
  Codespace ever balks, check Hermes docs for the exact install line — but on real
  Ubuntu it installs cleanly.
- Node from Ubuntu apt is v18/v20 = the working build. The broken Termux node was
  24/26 on Android bionic. Different OS, different story. That's the whole fix.
- After setup, tell me "read ~/ai_influencer/CONTINUITY.md and continue" in the new
  Codespace session and I'm back in flow with a WORKING browser.

=================================================================
CHEAT LINE (paste in Step 1)
=================================================================
sudo apt-get update -y && sudo apt-get install -y python3 python3-pip python3-venv nodejs npm git curl && node --version && pip3 install --upgrade pip && pip3 install hermes-agent && hermes --version && hermes setup tools
