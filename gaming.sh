#!/bin/bash
# ------------------------------------------------------------------------
# archblocks - minimal, modular, manual Arch Linux install script
# ------------------------------------------------------------------------
# es@ethanschoonover.com @ethanschoonover http://github.com/altercation/archblocks

# INSTRUCTIONS -----------------------------------------------------------
# boot into Arch Install media and run (for this script only):
#
# curl https://raw.github.com/altercation/archblocks/master/sample_installer.sh" > install.sh
#     (...manually review the code! look at the blocks in the repo, then...)
# bash install.sh

# RESPOSITORY ------------------------------------------------------------
REMOTE=https://raw.github.com/altercation/archblocks/master

# CONFIG -----------------------------------------------------------------

HOSTNAME=gaming
USERNAME=gaming
USERSHELL=/bin/bash
FONT=Lat2-Terminus16
FONT_MAP=8859-1_to_uni
LANGUAGE=en_US.UTF-8
KEYMAP=de
TIMEZONE=UTC
#MODULES="dm_mod dm_crypt aes_x86_64 ext2 ext4 vfat intel_agp drm i915"
#HOOKS="base udev modconf block filesystems usbinput fsck"
KERNEL_PARAMS=""
# KERNEL_PARAMS is used in FILESYSTEM, INIT, BOOTLOADER blocks (gets added to)

# DOTFILES / HOME SETUP --------------------------------------------------
# mr (available in AUR) allows you to setup your home dir using dvcs such
# as git, hg, svn and execute shell scripts automatically. 
# list a url to use as a mr config file and archblocks core install will
# su to the new user's (USERNAME above) home and bootstrap using it.
# mr will be installed if this variable is set.
#MR_BOOTSTRAP=https://raw.github.com/altercation/es-etc/master/vcs/.mrconfig

# BLOCKS -----------------------------------------------------------------
TIME=common/time_chrony_utc
LOCALE=common/locale_default
FILESYSTEM=filesystem/gpt_luks_passphrase_ext4
BOOTLOADER=bootloader/bios_grub2
NETWORK=network/wired_wireless_default
APPSETS="appsets/vim_basics appsets/server_utils"

# EXTRA PACKAGES ---------------------------------------------------------
# if you don't want to create a new block, you can specify extra packages
# from official repos or AUR here (simple space separated list of packages)
PACKAGES=""
AURPACKAGES="hlds"

# EXECUTE ----------------------------------------------------------------
. <(curl -fsL "${REMOTE}/blocks/_lib/helpers.sh"); _loadblock "_lib/core"

