#!/bin/bash

# Check if at least 3 arguments are provided
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 input_filename --fps <number> --loop_amount <number> output_filename"
    exit 1
fi

INPUT_PATTERN="$1"
shift

# Default values
FPS=10
LOOP_TIMES=1

# Parse the remaining arguments
while [[ $# -gt 1 ]]; do
    key="$1"
    
    case $key in
        --fps)
        FPS="$2"
        shift
        ;;
        --loop_amount)
        LOOP_TIMES="$2"
        shift
        ;;
        *)
        # Unknown option
        ;;
    esac
    shift
done

OUTPUT_FILENAME="$1"

# Convert images to video
ffmpeg -framerate $FPS -i $INPUT_PATTERN -vf "scale=1920:-1" -c:v libx264 -pix_fmt yuv420p -movflags +faststart -profile:v baseline -level 3.0 -y $OUTPUT_FILENAME

# Looping the video
for i in $(seq 1 $LOOP_TIMES); do
    echo "file '$OUTPUT_FILENAME'" >> temp_list.txt
done

ffmpeg -f concat -safe 0 -i temp_list.txt -c copy extended_$OUTPUT_FILENAME

# Cleanup
rm temp_list.txt

