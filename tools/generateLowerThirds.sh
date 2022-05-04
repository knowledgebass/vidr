#!/bin/bash
# Generate lower-thirds ontop of another video
# the base file in the static directory needs to stay in .mov (quicktime encoded with alpha layers)

# usage: ./generateLowerThirds.sh <input_video> <text> <output_location>
# example: ./generateLowerThirds.sh ../INPUT/dog.mp4 "Getting comfy..." ../OUTPUT/dog-overlay.mp4

melt ../src/static/lower_thirds/lower_thirds.mov -attach dynamictext:"$2" bgcolour=0x00000000 fgcolour="#2a506f" geometry="8%/82%:100%x100%:100" family="SourceSansPro-regular" valign="top" size="85" in=25 out=150 -track $1 -transition composite fill=1 a_track=1 b_track=0 -consumer avformat:$3 acodec=libmp3lame vcodec=libx264
