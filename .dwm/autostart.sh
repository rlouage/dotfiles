setxkbmap be
pipewire &
xwallpaper --zoom /windows/Users/Rob/Pictures/bg.jpg

while true; do
	xsetroot -name "$(date +"%a %d %b %H:%M:%S %Y")"
	sleep 1s
done &

nm-applet &
