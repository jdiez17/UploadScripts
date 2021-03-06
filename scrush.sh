#!/bin/sh
set -e
scrot -s /tmp/scrot.png;
json=$(curl -F file=@/tmp/scrot.png https://mediacru.sh/api/upload/file)
hash=$( echo "$json" | grep "hash" | cut -d '"' -f4)
echo -n https://mediacru.sh/$hash | xsel -b 
notify-send "Upload complete:\nhttps://mediacru.sh/$hash"
xdg-open https://mediacru.sh/$hash
