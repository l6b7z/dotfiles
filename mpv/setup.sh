#!/bin/bash

mkdir audio-conf

ln -s  --directory ../fonts audio-conf/fonts
ln -s  --directory ../script-modules audio-conf/script-modules
ln -s  --directory ../script-opts audio-conf/script-opts
ln -s ../input.conf audio-conf/input.conf
ln -s ../mpv.conf audio-conf/mpv.conf

mkdir audio-conf/scripts

ln -s  --directory ../../scripts/uosc audio-conf/scripts/uosc

ln -s ../../scripts/chapters.lua audio-conf/scripts/chapters.lua
ln -s ../../scripts/gallery-thumbgen.lua audio-conf/scripts/gallery-thumbgen.lua
ln -s ../../scripts/image-positioning.lua audio-conf/scripts/image-positioning.lua
ln -s ../../scripts/playlist-view.lua audio-conf/scripts/playlist-view.lua
ln -s ../../scripts/mpv-nextfile.lua audio-conf/scripts/mpv-nextfile.lua
ln -s ../../scripts/Rename.lua audio-conf/scripts/Rename.lua
ln -s ../../scripts/SimpleBookmark.lua audio-conf/scripts/SimpleBookmark.lua
ln -s ../../scripts/user-input.lua audio-conf/scripts/user-input.lua

cp scripts/autoload.lua audio-conf/scripts/autoload.lua
sed '0,/videos = true/{s/videos = true/videos = false/}' -i audio-conf/scripts/autoload.lua
sed '0,/audio = false/{s/audio = false/audio = true/}' -i audio-conf/scripts/autoload.lua

mkdir img-conf

ln -s ../img_input.conf img-conf/input.conf
ln -s ../img_mpv.conf img-conf/mpv.conf

mkdir img-conf/scripts

ln -s ../../scripts/gallery-thumbgen.lua img-conf/scripts/gallery-thumbgen.lua
ln -s ../../scripts/image-positioning.lua img-conf/scripts/image-positioning.lua
ln -s ../../scripts/playlist-view.lua img-conf/scripts/playlist-view.lua
ln -s ../../scripts/mpv-nextfile.lua img-conf/scripts/mpv-nextfile.lua
ln -s ../../scripts/Rename.lua img-conf/scripts/Rename.lua
ln -s ../../scripts/user-input.lua img_conf/scripts/user-input.lua

cp scripts/autoload.lua img-conf/scripts/autoload.lua
sed '0,/videos = true/{s/videos = true/videos = false/}' -i img-conf/scripts/autoload.lua
sed '0,/audio = false/{s/images = false/images = true/}' -i img-conf/scripts/autoload.lua


ln -s  --directory ../script-modules img-conf/script-modules
