#!/bin/sh

XMO_BUILD_DIR="$HOME/.cache/xmonad/build-x86_64-linux"
XMO_BIN="xmonad-x86_64-linux"
XMO_CONF="$HOME/.config/xmonad/xmonad.hs"

exec stack ghc --  \
  --make $XMO_CONF \
  -i               \
  -ilib            \
  -fforce-recomp   \
  -main-is main    \
  -v0              \
  -o $XMO_BUILD_DIR/$XMO_BIN
