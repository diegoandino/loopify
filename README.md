# loopify - a custom framerate video loop creator made with FFmpeg

## Usage
1. Install FFmpeg
   - MacOS: `brew install ffmpeg`
   - Windows: `choco install ffmpeg` or install from source
   - Linux: `sudo apt install ffmpeg` for Debian-based distro(s) or `pacman -S ffmpeg` for Arch-based distro(s)

2. Clone repository to desired directory
3. Do `chmod +x loopify.sh` to be able to execute it
4. From that directory you can run: `~/<pathToDir>/loopify.sh "<img_name.png or jpg>" --fps <fps_number> --loop_amount <loop_number> <output_name>.mp4`
   - An example would be: `~/Dev/ffmpeg/gifify.sh "exported-%02d.jpg" --loop_amount 4 --fps 8 output.mp4`
   - Note that the `%02d` means it will take all files in the directory called `exported-01, exported-02, etc.`
   - You can use different types like `%d` which could take files named like `exported-1, exported-2, etc.`
  
5. The output MP4 file will be in the same directory you run it in
