#!/usr/bin/env python3
"""
NOVA caption generator — outputs N days of paste-ready public-tier captions
from the locked voice + formulas. Run: python caption_generator.py 7
"""
import sys, random

HOOKS = [
    "healthy body, dangerous mind. that's the whole brand.",
    "did my mobility flow then thought about you the whole stretch. coincidence?",
    "ran this morning thinking about who's watching. motivates the last mile.",
    "new here? i'm nova — holistic athlete, your hot best friend who knows her shit.",
    "leg day. i go heavy because i like feeling strong and a little dangerous.",
    "morning stretch in bed before the world gets loud.",
    "the green smoothie that cleared my skin + killed my cravings.",
    "gym fit or cozy fit? pick one, i post the other later 😘",
]
VALUE = [
    "my 10-min mobility flow (cat-cow, world's greatest stretch, pigeon) — save it.",
    "post-run endorphins are the cheapest therapy i know.",
    "spinach, mango, ginger, collagen, coconut water. tastes like a vacation.",
    "small, daily, consistent. that's how you glow up without losing your softness.",
    "nourish the body, keep the fire. no starvation shit.",
    "i drink it slow in the morning sun and think about who's saving this.",
]
FLIRT = [
    "my green eyes are on you the whole time so you actually do it. 😏",
    "you should see what i look like when i'm actually trying. 😉",
    "mirror selfies hit different when you know someone's saving them.",
    "this is the version of me most people never see. intimate. the real nova.",
    "you're watching, aren't you.",
    "the rest of this? members only, babe. 🤍",
]
CTA = [
    "the uncensored me lives where the bio says. you'll know if you're invited. 🤍",
    "full routine (and the version i don't post here) is linked.",
    "more of that is one tap away. bio.",
    "my full nutrition checklist is where you think it is.",
    "members first, always. link in bio.",
]
TAGS = "#holistichealth #fitgirl #softlife #wellness #glowup #fit #confidence"

def make_caption(day):
    h = random.choice(HOOKS)
    v = random.choice(VALUE)
    f = random.choice(FLIRT)
    c = random.choice(CTA)
    return f"--- DAY {day} ---\nHOOK: {h}\nBODY: {v} {f}\nCTA: {c}\nTAGS: {TAGS}\n"

def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 7
    for d in range(1, n+1):
        print(make_caption(d))
        print()

if __name__ == "__main__":
    main()
