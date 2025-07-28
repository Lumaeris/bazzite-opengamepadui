#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

pushd . > /dev/null
dir="$(mktemp -d)"
cd "${dir}"
wget https://github.com/ShadowBlip/gamescope-session-opengamepadui/archive/refs/heads/main.zip
unzip main.zip
cp -R ./gamescope-session-opengamepadui-main/usr/share/* /usr/share/
popd > /dev/null
rm -rf "${dir}"
rm /usr/share/wayland-sessions/gamescope-session.desktop
ln -s gamescope-session-opengamepadui.desktop /usr/share/wayland-sessions/gamescope-session.desktop
rm /usr/bin/steamos-session-select
cp /usr/bin/opengamepadui-session-select /usr/bin/steamos-session-select
