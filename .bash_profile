#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# mount google drive to ~/drive
rclone mount --ignore-size --vfs-cache-mode full --daemon gdrive: ~/drive/

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	ssh-agent startx
fi
