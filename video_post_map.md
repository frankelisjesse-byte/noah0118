# ════════════════════════════════════════════════════════════════════
# NOVA — VIDEO POST MAP (the 20 clips I built → where they go)
# All clips: ~/storage/movies/NOVA_clips/ (gallery, post-ready, SFW,
# caption baked-in). 1080x1920 vertical. No audio (dub in CapCut or add
# music). Build script: teaser/build_library.sh (regenerates everything).
# ════════════════════════════════════════════════════════════════════

CLIP → USE
──────────────────────────────────────────────
day1a_t  "just a girl, a gold anklet..."        → DAY 1 intro post (IG/TikTok/Fanvue free)
day1b_t  "pink flamingo gym day..."             → Day 2-3 gym tease
day1c_t  "pancake brinner..."                   → Day 4 quirky-habit post (moat)
ph0a_t   "morning version soft..."              → Phase 0 soft-tease
ph0b_t   "saw you looking at the beach run"     → Phase 0 "caught" clip
ph0c_t   "the water knows things..."            → pool/sea tease
ph0d_t   "floor stretch, hip tilt..."           → stretch tease
ph0e_t   "post-run glow..."                     → run tease
ph0f_t   "sea wade, hair wet..."                → beach tease
ph1a_t   "version of me in your head..."        → Phase 1 "if only" seed
ph1b_t   "gym version tame..."                 → Phase 1 seed
ph1c_t   "made it this far, curious..."         → Phase 1 seed (strong)
ph1d_t   "asked if i have a real page..."       → Phase 1 seed (pre-launch)
ph1e_t   "freaky side is a ghost..."            → Phase 1 seed
p2a_t    "versions that don't make the feed"    → Phase 2 day 22 announce
p2b_t    "version that doesn't make feed..."    → Phase 2 teaser
p2c_t    "she is almost real. set a reminder"   → Phase 2 countdown
p2d_t    "T-minus. you asked for it..."         → Phase 2 T-2 frenzy
p2e_t    "other side of nova coming..."         → Phase 2 T-1
p2f_t    "soon. you'll know where to find me"   → Phase 2 launch-eve
nova_mix_30s  (all clips montage)              → X pinned / Reel sampler

POSTING RULES
──────────────────────────────────────────────
- Public (IG/TikTok/X): SFW clips ONLY, implication captions. Never name
  Fanvue until launch day. Turn on notifications in Phase 2.
- Fanvue free wall: same clips + the heat renders (mage_prompt_pack.md).
- One clip per post, 1-2/day public during build; daily free tease + the
  PPV cadence on Fanvue after launch.
- Add music in CapCut (trending audio = reach) or leave silent.

REGENERATE: bash teaser/build_library.sh (re-downloads + re-renders all 20).
NEW CLIPS: add an ENTRIES line in that script (KEY|URL|CAPTION, no apostrophes
in caption — this ffmpeg lacks wrap_width).
