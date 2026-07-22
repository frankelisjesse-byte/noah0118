#!/bin/bash
cd /data/data/com.termux/files/home/ai_influencer/teaser/lib
FONT=/data/data/com.termux/files/usr/share/fonts/TTF/DejaVuSans-Bold.ttf
curl -sL --max-time 30 -o day1d.png "https://v3b.fal.media/files/b/0aa2ddaf/0-qK_H_zTz3ktwGnW6EJ_9YC5ROYM.png"
curl -sL --max-time 30 -o p2c.png "https://v3b.fal.media/files/b/0aa30ee3/ldRljmWh4_k_ZHwg2eQDC_aVtbTXTq.png"
ffmpeg -y -i day1d.png -vf "zoompan=z='min(1.07,1.5)':d=90:s=1080x1920:fps=30,fade=t=in:st=0:d=0.4,fade=t=out:st=2.6:d=0.4" -c:v libx264 -pix_fmt yuv420p -r 30 -t 3.0 day1d.mp4 2>/dev/null
ffmpeg -y -i p2c.png  -vf "zoompan=z='min(1.06,1.5)':d=90:s=1080x1920:fps=30,fade=t=in:st=0:d=0.4,fade=t=out:st=2.6:d=0.4" -c:v libx264 -pix_fmt yuv420p -r 30 -t 3.0 p2c.mp4 2>/dev/null
# text via a var (no inline apostrophe quoting problem)
T1="stairmaster, but make it a dance break. pineapple on pizza: yes or no"
T2="she's almost real. set a reminder"
ffmpeg -y -i day1d.mp4 -vf "drawtext=fontfile=$FONT:fontcolor=white:fontsize=46:line_spacing=6:text='$T1':x=(w-tw)/2:y=h*0.66:shadowcolor=black:shadowx=3:shadowy=3:box=1:boxcolor=black@0.4:boxborderw=22:wrap_width=900" -c:v libx264 -pix_fmt yuv420p day1d_t.mp4 2>/dev/null
ffmpeg -y -i p2c.mp4  -vf "drawtext=fontfile=$FONT:fontcolor=white:fontsize=46:line_spacing=6:text='$T2':x=(w-tw)/2:y=h*0.66:shadowcolor=black:shadowx=3:shadowy=3:box=1:boxcolor=black@0.4:boxborderw=22:wrap_width=900" -c:v libx264 -pix_fmt yuv420p p2c_t.mp4 2>/dev/null
echo "rebuilt:"; ls -la day1d_t.mp4 p2c_t.mp4 2>/dev/null | awk '{print $5,$9}'
rm -f mix_list.txt
for f in *_t.mp4; do echo "file '$PWD/$f'" >> mix_list.txt; done
ffmpeg -y -f concat -safe 0 -i mix_list.txt -c:v libx264 -pix_fmt yuv420p nova_mix_30s.mp4 2>/dev/null
echo "MIX DURATION:"; ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 nova_mix_30s.mp4
cp *.mp4 ~/storage/movies/NOVA_clips/ 2>/dev/null
echo "final gallery count: $(ls ~/storage/movies/NOVA_clips/ | wc -l)"
