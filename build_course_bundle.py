#!/usr/bin/env python3
# Bundles the course markdown files into ONE styled HTML.
# Open the HTML on the phone browser -> Print -> Save as PDF = sellable product.
import html, os

BASE = os.path.expanduser("~/ai_influencer")
OUT = os.path.join(BASE, "COURSE_BUNDLE.html")

# Files to include, in reading order. (title, filename)
PARTS = [
    ("AI Income Blueprint + Tax Money You're Owed", None),  # cover
    ("Course 1 - AI Influencer From Zero", "COURSE_01_AI_INFLUENCER_FROM_ZERO.md"),
    ("The Method - Fill-in Templates", "template_pack.md"),
    ("Tax Money You're Legally Owed", "tax_crusher_knowledge.md"),
    ("Pricing & Next Steps", "tax_course_pricing.md"),
]

def strip_internal(text):
    # Drop lines meant for us, not the buyer (teacher notes / source comments).
    out, skip = [], False
    for line in text.splitlines():
        low = line.strip().lower()
        if low.startswith("# ") and ("teacher note" in low or "for us" in low):
            skip = True
        if low.startswith("teacher note"):
            skip = True
        if line.startswith("#") and line.strip().startswith("# ") and "source" in low:
            continue
        if skip and line.startswith("==="):
            # a divider after a skipped section ends the skip on next header
            continue
        if not skip:
            out.append(line)
    return "\n".join(out)

def md_to_html(text):
    text = strip_internal(text)
    lines = text.splitlines()
    body, in_pre = [], False
    for line in lines:
        s = line.rstrip()
        if s.startswith("=====") or set(s) == {"="} and s:
            continue  # decorative dividers
        esc = html.escape(s)
        if s.startswith("#"):
            continue  # skip file-header comment lines (not buyer-facing)
        if s.strip().startswith("MODULE") or s.strip().startswith("BOX ") or s.strip().startswith("TEMPLATE ") or s.strip().endswith("CHECKLIST"):
            body.append(f"<h2>{esc}</h2>")
        elif s.strip() and s.strip()[0:2] in ("A.","B.","C.","D.","1.","2.","3.","4.","5.","6."):
            body.append(f"<p class='pt'>{esc}</p>")
        elif s.strip().startswith("[ ]"):
            body.append(f"<p class='chk'>{esc}</p>")
        elif not s.strip():
            body.append("")
        else:
            body.append(f"<p>{esc}</p>")
    return "\n".join(body)

sections = []
for title, fn in PARTS:
    if fn is None:
        sections.append(f"""
        <div class='cover'>
          <h1 class='big'>{html.escape(title)}</h1>
          <p class='sub'>A legal, step-by-step system: build an income online + claim
          the tax money you're actually owed. No fluff. No fake promises.</p>
          <p class='sub small'>Ethics-first. Everything here is legal. Tax figures should
          be confirmed at IRS.gov / free VITA before you rely on exact numbers.</p>
        </div>
        <div class='pbr'></div>""")
        continue
    p = os.path.join(BASE, fn)
    if not os.path.exists(p):
        continue
    with open(p, encoding="utf-8") as f:
        sections.append(f"<div class='chapter'>{md_to_html(f.read())}</div><div class='pbr'></div>")

DOC = f"""<!doctype html><html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AI Income Blueprint + Tax Money You're Owed</title>
<style>
  body {{ font-family: Georgia, serif; max-width: 760px; margin: 0 auto; padding: 28px;
         color:#1a1a1a; line-height:1.5; }}
  h1 {{ font-size: 1.5em; border-bottom:2px solid #2b6; padding-bottom:6px; margin-top:1.4em; }}
  h1.big {{ font-size:2.2em; border:none; color:#175; text-align:center; margin-top:2.2em; }}
  h2 {{ font-size:1.15em; color:#175; margin-top:1.3em; }}
  .cover {{ text-align:center; padding:60px 10px; }}
  .sub {{ font-size:1.05em; color:#444; max-width:520px; margin:14px auto; }}
  .sub.small {{ font-size:.85em; color:#777; }}
  .pt {{ margin-left:14px; }}
  .chk {{ margin-left:10px; color:#175; }}
  .chapter p {{ margin:.4em 0; }}
  .pbr {{ page-break-after: always; }}
  @media print {{ body {{ padding:0 12px; }} }}
</style></head><body>
{''.join(sections)}
<div style='text-align:center;color:#999;font-size:.8em;margin-top:40px'>
  Built with care. Legal-only. You are owed more than you think.
</div>
</body></html>"""

with open(OUT, "w", encoding="utf-8") as f:
    f.write(DOC)
print("WROTE", OUT, "-", len(DOC), "chars,", len(sections), "sections")
