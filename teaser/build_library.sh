#!/bin/bash
# NOVA video library mass-producer (SFW, autonomous). FIXED: no wrap_width,
# apostrophe-free captions (this ffmpeg has no wrap_width on drawtext).
cd /data/data/com.termux/files/home/ai_influencer/teaser
FONT=/data/data/com.termux/files/usr/share/fonts/TTF/DejaVuSans-Bold.ttf
OUT=lib && mkdir -p "$OUT"

ENTRIES=(
"ph0a|https://v3b.fal.media/files/b/0aa2dfc6/kvv-O3iuWcOOB0EJOs4wM_tlczqVpK.png|morning version of me is soft. the night version? we do not talk about her here"
"ph0b|https://v3b.fal.media/files/b/0aa2dfc6/9_oBuR0y-Kw8gTP9JhYOF_f2HpUYKC.png|saw you looking at the beach run. i felt it"
"ph0c|https://v3b.fal.media/files/b/0aa2dfc7/NUXybnooGz4zL6reks8Qn_E5dUZWTq.png|the water knows things about me you do not. yet"
"ph0d|https://v3b.fal.media/files/b/0aa2dfc7/NH1w10qQwX5W1xgDvxAoR_lgpWFqeG.png|floor stretch, hip tilt, anklet catch. you noticed, did you not"
"ph0e|https://v3b.fal.media/files/b/0aa2dfc8/mQkx0-XHf8oGIZgrgOBYj_B4LOnP2z.png|post-run glow. some runs are for the body. some are for the person watching"
"ph0f|https://v3b.fal.media/files/b/0aa2dfc8/8VvAxU0FT008RYwIoIluN_zN35H1bR.png|sea wade, hair wet, laughing. this is the version you imagine"
"ph1a|https://v3b.fal.media/files/b/0aa2dfeb/5ErHuJrwZDN1yuDxySyye_xRxur0RB.png|you have got a version of me in your head by now. i can tell"
"ph1b|https://v3b.fal.media/files/b/0aa2dfeb/fc_KVpx-8B5pRF-dIhoXg_tOPYGbnV.png|the gym version of me is tame. the other version? different energy entirely"
"ph1c|https://v3b.fal.media/files/b/0aa2dfec/kSCoZpc4ga3d6w_ZMiFlL_G7HfYWd8.png|if you have made it this far and you are still curious, you are exactly who i made the other version for"
"ph1d|https://v3b.fal.media/files/b/0aa2dfee/ZwKSaSau5L7Q3Ra5c79Um_aDphrBGG.png|someone asked if i have a real page. cute. let us just say... imagine"
"ph1e|https://v3b.fal.media/files/b/0aa2dfed/TRa9vAzA92hcuz1pMqbkE_n2IFj2Dz.png|the freaky side is a ghost. present in the eye-contact, the ankle tilt, the lip bite"
"p2a|https://v3b.fal.media/files/b/0aa30ee5/M9KE5HXxvRH9ZIbRBlIz4_8d7X5TWi.png|some versions of me do not make the public page. they are for people who really pay attention"
"p2b|https://v3b.fal.media/files/b/0aa30ee2/h6_Eosod_pO4yl-_CIW-3_uoJz1ied.png|the version that does not make the feed is almost real"
"p2c|https://v3b.fal.media/files/b/0aa30ee3/ldRljmWh4_k_ZHwg2eQDC_aVtbTXTq.png|she is almost real. set a reminder"
"p2d|https://v3b.fal.media/files/b/0aa30ee3/RbKZM5_48rGJNmS-vw542_LKVfkrYG.png|T-minus. you asked for it. it is almost here"
"p2e|https://v3b.fal.media/files/b/0aa30ee5/6AUZTqykjLhcXBqATUTvm_feEh5lQr.png|the other side of nova is coming. turn on notifications"
"p2f|https://v3b.fal.media/files/b/0aa30ee4/uWCSFIOuDPWBa43N0tNvF_dTijL9PF.png|soon. you will know exactly where to find me"
"day1a|https://v3b.fal.media/files/b/0aa2ddae/BO0HLu2niogQ5cck0JwgL_4TKQzqh9.png|just a girl, a gold anklet, and a little too much energy. hi, i am nova"
"day1b|https://v3b.fal.media/files/b/0aa2ddae/yFYsK1oz1vmk9Spw2VCzQ_EQSpVnzz.png|pink flamingo gym day. the anklet stays on. always"
"day1c|https://v3b.fal.media/files/b/0aa2ddaf/GKJ4pVxdFKXwDk7h_-hJC_ejg3Gltp.png|pancake brinner. weird? maybe. but you are here, so"
)

for e in "${ENTRIES[@]}"; do
  KEY="${e%%|*}"; URL="${e#*|}"; URL="${URL%%|*}"
  curl -sL --max-time 40 -o "$OUT/$KEY.png" "$URL" || true &
done
wait

i=0
for e in "${ENTRIES[@]}"; do
  KEY="${e%%|*}"; CAP="${e##*|}"
  PNG="$OUT/$KEY.png"; ZOOM="$OUT/$KEY.mp4"; TXT="$OUT/${KEY}_t.mp4"
  [ -s "$PNG" ] || { echo "SKIP $KEY (no img)"; continue; }
  Z=$(awk "BEGIN{z=1.05+($i%8)*0.01; print z}")
  ffmpeg -y -i "$PNG" -vf "zoompan=z='min($Z,1.5)':d=90:s=1080x1920:fps=30,fade=t=in:st=0:d=0.4,fade=t=out:st=2.6:d=0.4" -c:v libx264 -pix_fmt yuv420p -r 30 -t 3.0 "$ZOOM" 2>/dev/null || { echo "ZOOM FAIL $KEY"; continue; }
  ffmpeg -y -i "$ZOOM" -vf "drawtext=fontfile=$FONT:fontcolor=white:fontsize=44:line_spacing=6:text='${CAP}':x=(w-tw)/2:y=h*0.66:shadowcolor=black:shadowx=3:shadowy=3:box=1:boxcolor=black@0.4:boxborderw=20" -c:v libx264 -pix_fmt yuv420p "$TXT" 2>/dev/null || { echo "TXT FAIL $KEY"; continue; }
  i=$((i+1))
done

echo "BUILT $i text-clips"
rm -f "$OUT/mix_list.txt"
for f in "$OUT"/*_t.mp4; do echo "file '$f'" >> "$OUT/mix_list.txt"; done
ffmpeg -y -f concat -safe 0 -i "$OUT/mix_list.txt" -c:v libx264 -pix_fmt yuv420p "$OUT/nova_mix_30s.mp4" 2>/dev/null || echo "MIX FAIL"
echo "MIX: $(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT/nova_mix_30s.mp4")s"
cp "$OUT"/*.mp4 ~/storage/movies/NOVA_clips/ 2>/dev/null
echo "GALLERY: $(ls ~/storage/movies/NOVA_clips/*.mp4 | wc -l) files"
