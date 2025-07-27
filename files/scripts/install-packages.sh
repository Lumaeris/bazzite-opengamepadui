#!/usr/bin/env bash
# this script is somewhat based on https://github.com/askpng/solarpowered/blob/main/files/scripts/base/bazzite.sh
# NOTE: this script may break sometimes for some obscure reason, so we have to restart the building of the images

set -ouex pipefail

OGUI_TAG=$(curl -s https://api.github.com/repos/ShadowBlip/OpenGamepadUI/releases | grep tag_name | cut -d : -f2 | tr -d 'v", ' | head -1)
IP_TAG=$(curl -s https://api.github.com/repos/ShadowBlip/InputPlumber/releases | grep tag_name | cut -d : -f2 | tr -d 'v", ' | head -1)
PS_TAG=$(curl -s https://api.github.com/repos/ShadowBlip/PowerStation/releases | grep tag_name | cut -d : -f2 | tr -d 'v", ' | head -1)

echo 'Installing OpenGamepadUI and related packages.'
dnf5 install -y \
    https://github.com/ShadowBlip/OpenGamepadUI/releases/download/v$OGUI_TAG/opengamepadui-$OGUI_TAG-1.x86_64.rpm \
    https://github.com/ShadowBlip/InputPlumber/releases/download/v$IP_TAG/inputplumber-$IP_TAG-1.x86_64.rpm \
    https://github.com/ShadowBlip/PowerStation/releases/download/v$PS_TAG/powerstation-$PS_TAG-1.x86_64.rpm
