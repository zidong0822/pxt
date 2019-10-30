palette="./palette.png"
filters="fps=15,scale=320:-1:flags=lanczos"

for file in *.mp4 ; do
    ffmpeg -i $file -vf "$filters,palettegen" -y $palette
    ffmpeg -i $file -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y "${file/%.mp4/.gif}"
done