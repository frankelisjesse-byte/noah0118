# NOVA — LIVE ALGORITHM RESEARCH (Codespace VM runbook)
# WHY: web tools are dead on Android/Termux (Rust/NDK crash, proven). The "what
# performers are doing RIGHT NOW" research MUST run on the Linux VM (Codespaces/Oracle,
# $0). This file is the turnkey runbook: stand up VM -> run research -> pipe findings
# back into nova_channel_algorithm_playbook.md. User said "use all" = execute full.

=================================================================
STEP 1 — STAND UP THE VM (one-shot, from codespaces_setup.md)
=================================================================
- GitHub Codespaces: open the Hermes repo in a Codespace (free tier, ~$0 if <60h/mo).
  OR Oracle Cloud Always-Free VM (Arm, $0).
- In the VM terminal, install Hermes per codespaces_setup.md, then:
  `hermes config set model <your-model>`
  `hermes config set provider <your-provider>`
- Verify web works: `curl -fsSL -o /dev/null -w "%{http_code}" https://google.com`
  expect 200. (On phone this fails; on VM it's fine.)

=================================================================
STEP 2 — RUN THE RESEARCH (invoke through terminal on the VM)
=================================================================
Use web_search / web_extract there. Targets:

A) TOP PERFORMERS IN NICHE (wellness + AI influencer + creator-economy):
   - Search: "top wellness creators TikTok 2026 growth", "AI influencer Fanvue
     strategy", "creator economy retention tactics".
   - For each top account found: log (handle, follower count, avg views, hook style,
     posting cadence, what they cross-post, how they drive to paid).
   - web_extract their top 3 posts' transcripts/captions where possible.

B) CURRENT TIKTOK/IG MECHANICS:
   - Search: "TikTok algorithm 2026 update", "Instagram Reels ranking 2026",
     "TikTok trending audio this week", "IG Reels share-to-DM signal".
   - Log any NEW signal weighting (e.g. if saves outrank shares now, or watch-time
     window changed). Update nova_channel_algorithm_playbook.md signal order.

C) META AD CREATIVE TRENDS (for nova_meta_test_blueprint.md refresh):
   - Search: "Meta ad creative trends 2026", "UGC ad hooks that convert 2026".
   - Log current winning hook structures to swap into the 3 organic winners.

D) COMPETITOR TEARDOWN (NOVA-adjacent):
   - Find 3-5 AI/wellness influencers with Fanvue. Log their free->paid bridge,
     pricing, PPV cadence. Adapt (don't copy) to NOVA's solo/no-guy positioning.

=================================================================
STEP 3 — PIPE BACK INTO THE PLAYBOOK (invoke through patch/write_file on VM)
=================================================================
- Append a "LIVE RESEARCH — <date>" section to nova_channel_algorithm_playbook.md
  with: confirmed signal order, current trending formats, 3-5 performer hook patterns
  to adapt, Meta creative refresh notes.
- Update the "ANTI-PATTERNS" if any new ban-risk surfaced.
- Save raw research notes to references/ for later sessions.

=================================================================
STEP 4 — ADAPT, DON'T COPY
=================================================================
NOVA's edge is solo / no-guy / charm-not-trash / anklet lore. Borrow MECHANICS
(hook length, posting time, signal triggers), never their identity or explicit style.
Keep her voice (nova_charm_videos.md) intact.

=================================================================
VERIFICATION
=================================================================
On the VM, after research: `search_files` for the new "LIVE RESEARCH" header in
nova_channel_algorithm_playbook.md and confirm it contains >=3 performer hook patterns
+ a dated signal-order update. That proves the "figure out the algorithm" task is DONE.
