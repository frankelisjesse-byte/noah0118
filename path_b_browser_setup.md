# FIX THE BROWSER — DEFINITIVE PATH (option B: Linux VM)
# STATUS (verified live this session): on THIS Android/Termux device the browser is
# UNFIXABLE in-software. Confirmed dead ends:
#   - Node V8 crash (agent-browser CLI can't run) — bare `node` fatal on v24 & v26.
#   - Termux chromium won't install (gtk3 has no candidate; dependency dead-end).
#   - pip returns ZERO packages (Termux Python sandbox) → playwright un-installable.
#   - web_search/firecrawl fails (Rust/NDK: "Failed to determine Android API level").
# All are DEVICE-level (Android/Termux), not flags/versions/config. Stop thrashing.
#
# THE FIX: run Hermes on a Linux/Mac/cloud VM. There Node + Chromium + firecrawl all
# work. Below = the 3 ways, cheapest first.

=================================================================
WAY 1 — YOU HAVE A PC OR MAC (best, free, instant)
=================================================================
- Install Hermes on that machine (Linux/Mac, not Termux).
- The browser tool + web_search work out of the box. Nothing to configure.
- Copy ~/ai_influencer/ over (it's just files) — the whole build travels.
- This is the recommended path if any real computer is available.

=================================================================
WAY 2 — CLOUD VM (phone-only, ~$5/mo, proper fix)
=================================================================
A small Linux VPS gives Hermes a real browser + live web research remotely.
STEPS:
1. Get a VPS: any of — Hetzner CX21 (~$5/mo), Oracle Free Tier (always-free ARM
   instance, $0), DigitalOcean Droplet ($6/mo), or a free GitHub Codespace.
2. SSH in, install Hermes per its docs (hermes setup).
3. Install deps: `curl -fsSL https://deb.nodesource.com/setup_20.x | bash -` then
   `apt install -y nodejs` (Node 20 — avoids the Android V8 issue entirely).
4. Run Hermes. The browser tool + web_search now WORK (real Node, real Chromium).
5. Optional: run it headless and connect from the phone via SSH/mosh so you drive
   it from the phone but the compute is in the VM.
NOTE: Oracle Free Tier + GitHub Codespaces = $0. That's the no-cost route if you
  don't want to spend. Codespaces even has a browser-backed terminal in the phone.

=================================================================
WAY 3 — TERMUX PROOT-DISTRO LINUX (free, on-phone, MAY still fail)
=================================================================
Runs a real Linux userspace INSIDE Termux, bypassing some Android limits.
  pkg install proot-distro
  proot-distro install ubuntu
  proot-distro login ubuntu
  # inside: apt update && apt install -y nodejs npm chromium
CAUTION: even inside proot, Android's linker/bionic can still trip Chromium/Node
  the same way (the V8 crash is bionic-level). This MIGHT work, MIGHT not. It's the
  only "stay on phone" experiment left, but treat as a long shot. If it crashes the
  same way, Way 2 is the answer.

=================================================================
WHAT WORKS TODAY (no browser needed)
=================================================================
- All NOVA + Tax Crusher work: done via text + the SFW image tool. Nothing blocked.
- Live research: only via the VM (Way 1/2) or you pasting findings in. The chat
  itself can't browse from this device.
- The phone's REAL browser: use it by hand; Hermes hands you URLs/steps.

=================================================================
BOTTOM LINE
=================================================================
Don't spend more turns on the phone's browser. It's a hardware/OS wall. Way 2 (a
$0-$5 Linux VM) is the real fix and unlocks browser + web_search + the firecrawl
backend. Until then, the build continues fine without it — we've proven that.
