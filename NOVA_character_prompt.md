# NOVA — CHARACTER PROMPT v2.1 (USER STANDARD: REAL, NOT PLASTIC)
# Updated 2026-07-21 per direct correction.
#
# USER'S EXACT STANDARD (verbatim intent):
#   "slight imperfections — perfect judging on scale, then amazingly beautiful but
#   human. NOT perfect in the barbie-doll way. The goal: you can't believe this is
#   not a real person. She's gotta be lovable, relatable, irresistable — and 'yours'
#   in the viewer's mind if you say the right words."
#
# TRANSLATION (what the renders must hit):
#   - KEEP slight human imperfections: real skin texture, pores, faint freckles,
#     natural asymmetry, a stray hair, subtle unevenness. NEVER airbrushed/waxy.
#   - TARGET realism = "indistinguishable from a real stunning woman." That is the
#     bar, not "flawless CGI."
#   - PERSONALITY is half the believability: girl-next-door, flirty, weird-cute
#     habits (Chad the fig, sock-drawer Sundays, pre-workout dance, anklet luck).
#     Voice makes her "lovable / relatable / irresistable / yours."
#   - IDENTITY locks (non-negotiable, reject any render that breaks these):
#       * caramel skin, warm undertone
#       * STRIKING EMERALD GREEN eyes (never brown/blue)
#       * long DARK wavy hair
#       * small gold hoop earrings BOTH ears
#       * THIN GOLD ANKLET on RIGHT ankle ONLY, always visible
#
# THE HARD TRUTH: chat FLUX cannot face-lock NOVA across images and defaults waxy.
# The path to "can't believe she's not real" + "one girl" = train a NOVA LoRA on a
# photoreal SDXL base (see NOVA_LORA_SPEC.md, run on the Linux VM). Use this prompt
# to BUILD the LoRA dataset, then the LoRA generates her forever-consistent.

=================================================================
BASE CHARACTER PROMPT (always include — identity + the "real, not plastic" look)
=================================================================
photograph of a real woman, candid unposed editorial portrait, natural caramel
skin with warm golden undertones, faint freckles across the nose bridge, visible
skin pores and slight natural unevenness (NOT airbrushed), striking emerald green
eyes with amber flecks (distinctly green, never brown), long dark wavy hair with a
few flyaway strands, small gold hoop earrings in both ears, a thin gold anklet
with visible chain links on her RIGHT ankle always, relaxed genuine half-smile with
subtle natural blush, girl-next-door but quietly confident, human and organic,
soft directional daylight, 85mm portrait lens, subtle film grain, unretouched,
real skin texture with imperfections

=================================================================
NEGATIVE PROMPT (always include — bans PLASTIC + bans broken traits)
=================================================================
plastic, waxy, porcelain, glass skin, airbrushed, doll-like, barbie, anime,
illustration, CGI, 3d render, over-smoothed, overly symmetrical, flawless
mannequin, extra limbs, deformed hands, mutated fingers, bad anatomy, blurry,
lowres, watermark, text, logo, oversaturated, multiple faces, cropped head,
missing anklet, anklet on wrong ankle, bracelet, wrist jewelry, brown eyes, blue
eyes, unnatural lighting, studio-glossy, hyper-polished, AI artifact, melted toes,
fused toes, detached earring, added piercings, nose stud

=================================================================
ANCHORED TRAIT TABLE (measure, don't guess)
=================================================================
SKIN   : caramel, warm undertone. hex ~#B07D56 face, #8D5524 shadow. Faint
         freckles (3-7) on nose bridge. VISIBLE PORES required (kills plastic look).
EYES   : EMERALD GREEN ~#2E8B57 + amber flecks. Almond, slight upturn. NEVER brown.
HAIR   : dark brown-black ~#1A1008, long mid-back, loose wave, flyaways.
JEWELRY: small gold hoops BOTH ears + THIN gold anklet RIGHT ankle only. Both always
         visible = her easter-egg ID. NO bracelets, NO nose stud, NO extra piercings.
BUILD  : slim athletic, toned but soft.
EXPRESSION: relaxed genuine half-smile, subtle blush. Confident, never vacant.
VOICE  : girl-next-door flirty, relentless-but-joyful, weird-cute. Makes the viewer
         feel she's THEIRS. (This is what makes her lovable/relatable/irresistable.)

=================================================================
CONSISTENCY RULES (one girl, not six)
=================================================================
1. BASE never changes; only [SCENE] swaps. Identity lives in BASE.
2. Anklet ALWAYS right ankle + hoops both ears. Reject any render that drops/
   moves them or adds jewelry we didn't ask for.
3. Green eyes + caramel + dark wavy = reject drift.
4. REAL fix for cross-image face-lock = NOVA LoRA (NOVA_LORA_SPEC.md). The chat
   tool is good for ONE hero but cannot guarantee she stays one girl without a LoRA.
5. If a render drifts: regenerate with BASE unchanged, do NOT rewrite her.

=================================================================
RENDER SETTINGS / WHERE
=================================================================
- SFW (chat): image_generate (FAL FLUX), SFW only, seed honored per identical prompt.
- HEAT: mage.space / civitai / seaart (NSFW on) — paste BASE + scene.
- MAX realism + one-girl lock: local SDXL + NOVA LoRA on the Linux VM.
- Sampler DPM++ 2M Karras, steps 28-35, CFG 6-8. Portrait 768x1152.
- Seed: lock ONE seed per "look"; vary only POSE. Anchor = seed 101 (H1 window
  render read as a genuine real photo in audit — use as the hero reference).

=================================================================
HERO SET (verified 2026-07-21, audited real by vision, all traits locked)
=================================================================
Generated on chat FAL FLUX, anchor seed 101, audited for realism + ID traits.
Reads as REAL photographs (9-10/10). Use as public feed + LoRA dataset seeds.
H1 window  (10/10): https://v3b.fal.media/files/b/0aa33a4f/-l9TgldjlclcqFdVSaXWp_BUlr9oG7.png
H2 street  (10/10): https://v3b.fal.media/files/b/0aa33a8d/4tqj9MSUqEKPNYbhkyHnF_IiQcX6rM.png
H4 beach  ( 9/10): https://v3b.fal.media/files/b/0aa33a8c/hpNSFCLJIOT6vCZaVtXgj_py3Q3jNJ.png
H5 sweater ( 9/10): https://v3b.fal.media/files/b/0aa33a9a/AVPiDXo32PL-qMZ8Tk7iN_Qf7DIJ3K.png
H6 mirror  (10/10): https://v3b.fal.media/files/b/0aa33a8c/E3_Rrk4Bw1IJbl1QvvUTm_GnTkPW8w.png
ALL 5 confirmed: caramel skin, GREEN eyes, dark wavy hair, gold hoops both ears,
thin gold anklet on RIGHT ankle only, no extra jewelry, no piercings, NOT waxy.
H3 GYM = WEAK (FLUX invents a ring on hip/floor poses; tool limit, not spec).
  Use the mirror (H6) as the gym-adjacent hero for now. The TRUE gym hero comes from
  the NOVA LoRA (NOVA_LORA_SPEC.md) which bakes the "no extra jewelry" rule in and
  face-locks her. Do not use the chat gym renders in the public feed.

=================================================================
POSES / THEMES (swap [SCENE] into BASE)
=================================================================
T1 LINGERIE BOUDOIR (heat, OFF-CHAT) | T2 BAREFOOT GROUNDED (feet niche, SFW ok)
T3 SHOWER/WET (heat, OFF-CHAT) | T4 ATHLETIC IMPLIED (borderline SFW)
T5 BEDROOM EYE-CONTACT (PPV mid, OFF-CHAT) | T6 THEMED CUSTOM (custom_intake.md)
HERO SFW: H1 window | H2 street laugh | H3 gym stretch | H4 beach barefoot |
          H5 cozy sweater | H6 mirror selfie  (regenerate anchored on H1/seed 101)
=================================================================
SAFETY / LEGAL: NOVA is an AI character; keep disclosure where required. No minors,
no non-consent, no illegal. Payments via Fanvue. Operator anonymous (alias + 2FA).
