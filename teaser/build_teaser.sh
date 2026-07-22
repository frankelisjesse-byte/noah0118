#!/bin/bash
# NOVA "coming attraction" teaser — SFW, 15s, 6 Phase-2 images, Ken Burns zoom
# + on-screen text cards (VO script). No audio (TTS broken on-device; dub in CapCut).
set -e
cd /data/data/com.termux/files/home/ai_influencer/teaser

FONT=/data/data/com.termux/files/usr/share/fonts/TTF/DejaVuSans-Bold.ttf

# image local copies (download from fal CDN)
declare -A IMG=(
  [p1]="https://v3b.fal.media/files/b/0aa30ee5/M9KE5HXxvRH9ZIbRBlIz4_8d7X5TWi.png"
  [p2]="https://v3b.fal.media/files/b/0aa30ee2/h6_Eosod_pO4yl-_CIW-3_uoJz1ied.png"
  [p3]="https://v3b.fal.media/files/b/0aa30ee3/ldRljmWh4_k_ZHwg2eQDC_aVtbTXTq.png"
  [p4]="https://v3b.fal.media/files/b/0aa30ee3/RbKZM5_48rGJNmS-vw542_LKVfkrYG.png"
  [p5]="https://v3b.fal.media/files/b/0aa30ee5/6AUZTqykjLhcXBqATUTvm_feEh5lQr.png"
  [p6]="https://v3b.fal.media/files/b/0aa30ee4/uWCSFIOuDPWBa43N0tNvF_dTijL9PF.png"
)
for k in p1 p2 p3 p4 p5 p6; do
  curl -sL -o $k.png "${IMG[$k]}"
done

# Build each clip: zoompan (slow ken burns) to 1080x1920 (9:16), 2.5s each
make_clip() {
  local in=$1 out=$2 zt=$3 zoom=$4
  ffmpeg -y -i "$in" -vf "\
zoompan=z='min($zoom,1.5)':d=75:s=1080x1920:fps=30,\
fade=t=in:st=0:d=0.4,\
fade=t=out:st=2.1:d=0.4" -c:v libx264 -pix_fmt yuv420p -r 30 -t 2.5 "$out"
}

make_clip p1.png c1.mp4 0 1.05
make_clip p2.png c2.mp4 0 1.08
make_clip p3.png c3.mp4 0 1.06
make_clip p4.png c4.mp4 0 1.07
make_clip p5.png c5.mp4 0 1.10
make_clip p6.png c6.mp4 0 1.05

# Overlay text on each clip (drawtext, centered lower third, white w/ shadow)
text_clip() {
  local in=$1 out=$2 txt=$3
  ffmpeg -y -i "$in" -vf "\
drawtext=fontfile=$FONT:fontcolor=white:fontsize=58:line_spacing=8:\
text='$txt':x=(w-tw)/2:y=h*0.66:shadowcolor=black:shadowx=3:shadowy=3:\
box=1:boxcolor=black@0.35:boxborderw=24" -c:v libx264 -pix_fmt yuv420p "$out"
}

text_clip c1.mp4 t1.mp4 "you've been imagining her"
text_clip c2.mp4 t2.mp4 "the version that doesn't make the feed"
text_clip c3.mp4 t3.mp4 "she's almost real"
text_clip c4.mp4 t4.mp4 "set a reminder"
text_clip c5.mp4 t5.mp4 "the other side of nova is coming"
text_clip c6.mp4 t6.mp4 "soon. you'll know where to find me"

# Concat
printf "file '%s'\n" t1.mp4 t2.mp4 t3.mp4 t4.mp4 t5.mp4 t6.mp4 > list.txt
ffmpeg -y -f concat -safe 0 -i list.txt -c:v libx264 -pix_fmt yuv420p nova_teaser_15s.mp4

echo "DONE: nova_teaser_15s.mp4"
ls -la nova_teaser_15s.mp4
