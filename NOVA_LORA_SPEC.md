# NOVA — LORA TRAINING SPEC (the real path to "can't believe she's not real")
# Why this exists: chat FLUX cannot face-lock NOVA across images and defaults to
# waxy/plastic. A trained LoRA on a PHOTOREAL base model is the only reliable way to
# get (a) ONE consistent girl forever, (b) realism so high viewers can't tell she's
# AI, (c) the technical backbone of the ACADEMY ("here's exactly how we made her").
# Run on the Linux VM (codespaces_setup.md) — local SDXL + kohya_ss. Chat CANNOT do this.

=================================================================
GOAL
=================================================================
Train a NOVA LoRA that, when applied to a photoreal SDXL base, outputs the same
caramel-skin / green-eyed / dark-wavy / gold-hoop / right-anklet woman every time,
with real skin texture (pores, freckles, slight imperfection) and zero plastic look.

=================================================================
BASE MODEL (pick ONE photoreal SDXL checkpoint)
=================================================================
- Juggernaut XL v9 (best photoreal + skin)  — recommended
- OR Realistic Vision v6.0 / Epic Realism XL
- Format: SDXL .safetensors. Load via ComfyUI or AUTOMATIC1111 on the VM.

=================================================================
DATASET (what to feed it)
=================================================================
20-40 images of NOVA, ALL using NOVA_character_prompt.md BASE + varied [SCENE]:
- 6-10 SFW hero renders (window, street, gym, beach, sweater, mirror) — anchored.
- 10-20 heat/PPV renders (boudoir, barefoot, shower, bedroom eye-contact) made on a
  PERMITTED NSFW backend (mage.space/civitai/seaart) pasting the BASE + scene.
- 5-10 "personality" shots (laughing, mid-yawn, holding mug, with Chad the fig).
RULES: same face/identity across all; varied pose/light/clothing only; 768x1152 or
1024x1024; caption EVERY image with the shared trigger + scene tags (see below).
REJECT from dataset any image that breaks ID traits (wrong eye color, missing
anklet, waxy skin, melted toes).

=================================================================
CAPTIONING
=================================================================
Trigger word: NOVA (or "nova woman"). Every caption starts with the trigger, then
describes scene/clothing/pose/light. Keep identity words OUT of captions where
possible so the LoRA learns the face from the trigger alone (standard kohya practice:
use a repeated trigger + minimal face descriptors; let the base model supply "woman").
Example caption: "nova woman, sitting by sunny window, cream t-shirt, candid smile,
shallow depth of field, film grain"

=================================================================
TRAINING (kohya_ss / sd-scripts)
=================================================================
- Toolkit: kohya_ss GUI (or cli). LoRA, SDXL, network: Kohya DyLoRA or standard LoRA.
- dim / alpha: 32 / 16 (start); raise to 64 / 32 if face weak after first run.
- steps: ~1500-2500 (20-40 imgs * ~40 repeats * ~8 epochs).
- lr: 1e-4 (UNET), 5e-5 (text encoder). scheduler: cosin. optimizer: AdamW8bit.
- bucket resolution: 1024. noise offset 0.0. clip sample prompt: test grid.
- Save every 250 steps; pick the checkpoint with best face-lock + realism, not lowest loss.
- VRAM: ~12GB (RTX 3060 12GB / A10G on Codespace). If <12GB, use 768 res + gradient ckpt.

=================================================================
INFERENCE (generating NOVA after training)
=================================================================
- Load base model + NOVA LoRA (strength 0.7-0.9).
- Prompt: "<nova woman>, [scene], real skin texture, pores, freckles, emerald green
  eyes, dark wavy hair, gold hoops, thin gold anklet right ankle, 85mm, film grain".
- Negative: same as NOVA_character_prompt.md negative (bans plastic + broken traits).
- Seed: lock per set; vary pose only. She will now be ONE girl across all renders.

=================================================================
WHY THIS CRUSHES THE CHAT CEILING
=================================================================
- Chat FLUX: new face every prompt, waxy default, no anklet guarantee, SFW only.
- NOVA LoRA: same face every time, realism tunable to "can't believe," anklet baked
  in, heat possible on the same model. This is the Academy's proof of method.

=================================================================
NEXT ACTION (when VM is up)
=================================================================
1. Stand up Codespace (codespaces_setup.md). 2. Pull 20-40 dataset images (use chat
for SFW heroes + permitted backend for heat). 3. Run kohya_ss with params above.
4. Grid-test checkpoints; pick best; bake into generation pipeline. 5. Regenerate the
entire paired + master queue through the LoRA so the whole feed is one consistent,
photoreal NOVA. 6. Academy module = record this process as the "how we made her" lesson.
=================================================================
