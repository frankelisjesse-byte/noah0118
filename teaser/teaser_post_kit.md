# NOVA "COMING ATTRACTION" TEASER — POST KIT
# File: ~/storage/movies/NOVA_teaser/nova_teaser_15s.mp4 (in gallery + TikTok picker)
# Built with ffmpeg from the 6 Phase-2 SFW images (Ken Burns slow zoom +
# on-screen VO text cards). SFW — the heat lives on the Fanvue wall at launch.
# No audio track (TTS broken on-device) — dub the VO in CapCut OR run silent
# with music. Either reads as a premium "coming soon."

=================================================================
THE TEASER ITSELF (what's on screen, 15s)
=================================================================
0-2.5s   p1 anklet windowsill  → "you've been imagining her"
2.5-5s    p2 mirror robe       → "the version that doesn't make the feed"
5-7.5s    p3 silhouette window → "she's almost real"
7.5-10s   p4 doorway lean      → "set a reminder"
10-12.5s   p5 portrait flirty   → "the other side of nova is coming"
12.5-15s   p6 golden hour      → "soon. you'll know where to find me"
Cut: soft fades between, slow zoom on every frame. Sultry, not explicit.

=================================================================
VO SCRIPT (paste into CapCut TTS if you dub — sultry female voice)
=================================================================
"you've been imagining her. the version of me that doesn't make the feed...
she's almost real. set a reminder — the other side of nova is coming,
and she's exactly who you think. soon. you'll know where to find me."

=================================================================
CAPTION (post alongside the video)
=================================================================
the other side of nova is coming. 👀 set your reminder — she's exactly who
you've been imagining. you'll know where to find me when she drops. 🤍
#holistichealth #fitgirl #softlife #wellness #comingsoon #aiinfluencer #teaser

=================================================================
WHEN TO POST
=================================================================
- This is a SUSPENSE asset, not a Phase-0 "meet NOVA" post. Use it from
  ~day 18 onward (after the audience knows + likes her) up through launch.
  Earliest safe drop: once Phase 1 "if only" seeds have landed (day 11+).
- Post to TikTok + IG Reels + X. Pin it on X during the countdown.
- Pair with a Stories poll: "the other nova drops soon — patient or impatient? 👇"
- NEVER put the Fanvue link in the teaser caption. Link goes live day 31.

=================================================================
REBUILD / REMIX (if you want a 7s cut, or swap frames)
=================================================================
Script: ~/ai_influencer/teaser/build_teaser.sh
- 7s cut: change each -t 2.5 to -t 1.2 and keep 4 frames.
- Swap frames: edit the IMG array (Phase-0 / week1 URLs) and rerun.
- Add music: ffmpeg -i nova_teaser_15s.mp4 -i <music.mp3> -c copy -shortest out.mp4
  (or just add a track in CapCut — easier).

=================================================================
STATUS
=================================================================
RENDERED + VERIFIED: 1080x1920, 15.0s, 2.2MB, valid mp4.
Location: ~/storage/movies/NOVA_teaser/nova_teaser_15s.mp4
Source images: the 6 Phase-2 SFW URLs in phase2_captions.md.
