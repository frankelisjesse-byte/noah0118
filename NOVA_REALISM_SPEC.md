# NOVA_REALISM_SPEC.md — making her read as a real, irreplaceable woman
# Built 2026-07-21 after polishing the character to "flawless-HUMAN" standard.
# Goal (user): amazingly beautiful but unmistakably HUMAN — not barbie/plastic.
# Slight imperfections (pores, freckles, natural asymmetry) are the FEATURE, the
# proof she's real. She must feel lovable, relatable, irresistible.

=====================================================================
WHAT WORKS (proven on seed 101 hero set, batch 2)
=====================================================================
- 5 of 6 heroes scored 9-10/10 "reads as a real human photo, not AI."
- Skin: real pores + freckles + natural sheen, NOT waxy. PASS.
- Identity traits locked: caramel skin, GREEN (not brown) eyes, dark wavy hair,
  gold hoops, girl-next-door warmth. PASS.
- "Lovable/relatable": confirmed by vision audit on window, street, sweater.
- Best single hero = street barefoot (seed 101, file 0aa33a6f/BPcVMJUSPw...):
  correct right-ankle anklet, separated toes, 10/10 realism, joyful.

=====================================================================
THE ONE WEAK SPOT — ANKLET SIDE FLIPS
=====================================================================
- The chat FAL model mirrors left/right inconsistently. Sometimes the thin gold
  anklet lands on her left ankle instead of her RIGHT (her signature ID).
- Gym + beach poses also sometimes hide the ankle entirely.
- FIX (in-chat, acceptable): prompt "RIGHT ankle" + frame the ankle in-shot
  ("legs bent, right ankle in lower foreground"). Beach fixed this way (10/10).
  Gym still flips ~50% — re-roll until right.
- REAL FIX (permanent): NOVA LoRA (see below) bakes the right-anklet + face in.

=====================================================================
THE PERMANENT FIX — TRAIN A NOVA LoRA (this is the Academy's backbone)
=====================================================================
A LoRA trained on the hero set + a few heat renders makes EVERY future image
the exact same girl with the exact same right-ankle anklet. This is the technical
proof piece for "the Academy" — here's how we made something so perfect.

STEPS (on the Linux VM — codespaces_setup.md):
1. Collect 20-30 clean NOVA images (the seed-101 hero set + best heat renders).
   Crop/align faces. Keep BASE traits identical across all.
2. Caption each: "nova, caramel skin, green eyes, dark wavy hair, gold hoops,
   gold anklet right ankle, girl-next-door" + scene/pose tags.
3. Train SDXL LoRA (Kohya_ss or OneTrainer):
   - base: SDXL 1.0
   - resolution 1024, batch 4, epochs 10-15, lr 1e-4 (cosine), rank 32 / alpha 16
   - save every 2 epochs, pick best by visual eye-lock test
4. Inference: <lora:nova:0.8> + BASE prompt. Now face + anklet + traits are locked
   across unlimited poses. Render heat on mage.space/civitai/seaart with the LoRA.
5. This is also the moat: a consistent character = real influencer, not random AI.

WHY NOT JUST USE CHAT FAL FOREVER:
- Chat FAL honors seed but NOT true cross-image face-lock (re-rolls vary).
- LoRA = the only way to 100% guarantee "one girl, every post, forever."

=====================================================================
RENDER RULES (paste into every generation)
=====================================================================
BASE (identity — never changes):
  photograph of a real woman, candid unposed editorial portrait, natural caramel
  skin with warm golden undertones, faint freckles across nose bridge, visible fine
  skin pores and natural texture, striking emerald GREEN irises clearly green not
  brown with amber flecks, long dark wavy hair with flyaway strands, delicate gold
  hoop earrings, thin gold anklet on her RIGHT ankle always visible, relaxed genuine
  half-smile with subtle natural blush, girl-next-door quietly confident, warm lovable
  relatable expression, human and organic, slight natural imperfections, unretouched,
  subtle film grain, 85mm lens, soft natural daylight
NEGATIVE (kills tells):
  plastic skin, airbrushed, doll-like, barbie, anime, CGI, 3d render, over-smoothed,
  glass skin, waxy, painted, overly symmetrical, flawless mannequin, extra limbs,
  deformed hands, mutated fingers, fused melted toes, bad anatomy, blurry, lowres,
  watermark, text, logo, oversaturated, multiple faces, hidden ankle, missing anklet,
  missing hoop earrings, brown eyes, unnatural lighting, studio-glossy, hyper-polished
SETTINGS:
  seed 101 for ID images; CFG 6-7; steps 30; portrait 768x1152.
  VARY ONLY the scene/pose line — never rewrite BASE.

=====================================================================
AUDIT LOOP (run before any image goes public or to Fanvue)
=====================================================================
For each render ask: real-or-AI? 1-10? plastic/barbie? right-ankle anklet?
green eyes? separated toes if barefoot? If any NO → re-roll with BASE unchanged,
lower CFG. Don't ship a tell.

=====================================================================
CURRENT BEST HERO FILES (seed 101, batch 2) — gallery + URLs
=====================================================================
H1 window  : 0aa33a6f/RL88qfyEap1SYeO_b7s0y_NxSPC5og.png  (10/10, warm)
H2 street  : 0aa33a6f/BPcVMJUSPw4VswqAREBHe_2EZh6wqT.png  (10/10, BEST, right anklet)
H3 gym*    : 0aa33a8d/RHiZIkq39MQtinga9-fZq_HGu3h8Kq.png  (9.5/10, re-roll anklet side)
H4 beach   : 0aa33a8e/B6m-VZN8WAjrGuwTdZPTC_p6deMxS1.png  (10/10, right anklet, barefoot)
H5 sweater : 0aa33a71/UJIOdieeItVEDrUv_ZfH8_sKQ36zdH.png  (9/10, warm/relatable)
H6 mirror  : 0aa33a71/ESCpKT8XDsC-DpERHaJ_m_OZt41iQI.png (9/10, playful)
Gallery copy: ~/storage/pictures/NOVA_hero6/
*H3 = re-roll once more for right-ankle anklet, or accept + fix in LoRA.
