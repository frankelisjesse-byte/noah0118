# NOVA — "SHE REMEMBERS YOU" CONTINUITY SYSTEM (architecture)
# The bond layer: NOVA appears to recall each subscriber's name, past conversations,
# preferences. This is a SYSTEM we run (not the images "thinking"). Honest about that.
# Goal: every fan feels like the only one. That = renewals + word of mouth.

=================================================================
THE HONEST MODEL
=================================================================
NOVA's images/videos are generated. They don't "remember." The REMEMBERING is a data
layer WE maintain per subscriber:
- A profile per fan: name, how they found her, past messages, preferences, milestones.
- When NOVA "replies," the reply is drafted using that profile (by you or a script).
- Fans experience continuity because WE keep the thread. She "never forgets" because
  we don't.

=================================================================
DATA WE STORE PER FAN (lightweight, ethical)
=================================================================
- Display name (what they want her to use)
- First-contact date + which free post brought them
- Recurring details they shared (kid's name, bad day, inside joke)
- Their "type" notes (soft vs feral preference — for content tailoring)
- Milestones: day-1 sub, found a code, birthday, renewal count
ALL stored with consent implied by platform ToS; never sold, never shared. Private.

=================================================================
HOW IT RUNS DAY TO DAY
=================================================================
1. New sub → welcome DM uses their name + references the free post that hooked them.
2. Each reply pulls their profile → "you said mornings were hard, how's the new job?"
3. Weekly: NOVA "references" a past convo publicly (anonymized) → others feel seen too.
4. Milestones auto-acknowledged: "month 2 with you. still my favorite morning person."

=================================================================
TOOLING (what we can build)
=================================================================
- A simple local DB / spreadsheet (subscriber_profiles.csv) — you maintain it.
- A prompt-template system: drop in {name} {detail} → NOVA-style reply drafted.
- (On the Codespace VM, this could be a small script that logs DMs + drafts replies.
  Not on this phone — needs the working environment.)
- dm_scripts.md already has the voice; this system feeds it the personal variables.

=================================================================
ETHICS / SAFETY
=================================================================
- No fabrication of fake intimacy that crosses into deception about being "real" — NOVA
  is an AI persona, disclosed per platform rules. The CARE is real; the memory is a
  system. Fans know she's AI (Fanvue permits AI; we're upfront).
- No storing anything that puts a fan at risk. Light, warm, consensual data only.
- This is the ANTI-ONLYFANS-spam positioning: personalized, not transactional.

=================================================================
WHY IT PRINTS
=================================================================
Retention is everything in this business. A subscriber who's "known" for 3 months
stays 12. The memory system is the retention engine. Cheap to run, impossible for
raunchy-trash competitors to copy because it requires actual care infrastructure.
