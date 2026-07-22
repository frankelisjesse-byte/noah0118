#!/usr/bin/env python3
# observation_aggregate.py — pure stdlib, no pip needed.
# Reads observation_sheet.csv and prints per-variant winners.
# Run: python3 observation_aggregate.py
# (On phone: copy to a folder with the csv, run via Termux python3.)
import csv, sys
from collections import defaultdict

CSV = "observation_sheet.csv"

def num(x):
    try: return float(x)
    except: return 0.0

def main():
    rows = []
    with open(CSV, newline="") as f:
        for r in csv.DictReader(f):
            if not r.get("date") or str(r.get("post_id","")).startswith("ex"):
                continue  # skip blanks + example rows
            rows.append(r)
    if not rows:
        print("No real data rows yet. Log posts, then re-run.")
        return
    print(f"Loaded {len(rows)} posts.\n")

    groups = ["var_voice","var_smile","var_outfit","var_motion","var_caption","var_hook"]
    metrics = ["reach","profile_visits","link_clicks","fanvue_visits","new_subs","saves","shares","comments"]
    # completion_pct is a %; treat separately

    for g in groups:
        agg = defaultdict(lambda: defaultdict(float))
        cnt = defaultdict(int)
        for r in rows:
            k = r.get(g,"?")
            cnt[k]+=1
            for m in metrics:
                agg[k][m]+=num(r.get(m))
        print(f"=== {g} ===")
        # conversion score = link_clicks*new_subs per 1k reach (guard div0)
        scored = []
        for k in cnt:
            reach = agg[k]["reach"] or 1
            conv = (agg[k]["link_clicks"]*agg[k]["new_subs"])/(reach/1000) if reach else 0
            reachscore = (agg[k]["saves"]+agg[k]["shares"])/ (reach/1000) if reach else 0
            scored.append((k,cnt[k],conv,reachscore,agg[k]["new_subs"],agg[k]["link_clicks"]))
        scored.sort(key=lambda x:-x[2])
        for k,n,conv,rs,subs,clicks in scored:
            print(f"  {k}: n={n} conv_score={conv:.2f} reach_score={rs:.2f} subs={int(subs)} clicks={int(clicks)}")
        # winner by conversion
        if scored:
            w = scored[0]
            print(f"  >> WINNER (conversion): {w[0]}  (retire lowest)")
        print()

    # overall totals
    tot = {m:sum(num(r.get(m)) for r in rows) for m in metrics}
    print("TOTALS:", {m:int(tot[m]) for m in tot})
    if tot["reach"]:
        print(f"Blended link-click rate: {tot['link_clicks']/tot['reach']*100:.2f}% of reach")
        print(f"Blended sub rate: {tot['new_subs']/tot['reach']*100:.3f}% of reach")

if __name__ == "__main__":
    main()
