#!/bin/bash

DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
CONFIG_DIR="$DIR/config"

case "$1" in
  macosx)
    CONFIG_SCRIPT="$CONFIG_DIR/configure-macosx.sh"
    "$CONFIG_SCRIPT"
    ;;
  *)
    echo "Usage: ./setup.sh <os>"
    echo "Supported operating systems:"
    echo "  * Mac OS X (flag: macosx)"
    exit
    ;;
esac
