# Bazzite with [OpenGamepadUI](https://github.com/ShadowBlip/OpenGamepadUI)

## To-do

* [ ] Add a way to switch to desktop mode
* * "Exit" button acts like "Restart Steam" on Steam Gaming Mode, probably rename that as well.
* [ ] Change boot animation
* [x] Somehow add a screen keyboard?
* * Apparently after selecting the “Steam Deck” controller, it realized it needed to bring up the keyboard. It's not perfect, but it's something at least.
* [ ] Open the Steam minified UI when opening any Steam game
* [x] Add a way to automate installing the latest RPMs
* [ ] Add an ujust script to turn off OGUI in favor of Steam Gaming Mode

## Installation

To rebase an existing Bazzite-Deck installation to the latest build (add `-gnome` before `:latest` if you're using GNOME):

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/lumaeris/bazzite-opengamepadui:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/lumaeris/bazzite-opengamepadui:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/lumaeris/bazzite-opengamepadui
cosign verify --key cosign.pub ghcr.io/lumaeris/bazzite-opengamepadui-gnome
```
