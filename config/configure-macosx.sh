#!/bin/bash

CONFIG_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
DIR=$(cd "$CONFIG_DIR" && cd .. && pwd)
FILE_LOCATIONS="$CONFIG_DIR/file_locations_macosx.txt"
DOTFILES="$DIR/dotfiles"
PKGTOOLS="$DIR/pkgsrc/bin"

BIN_DIR="$HOME/bin"

function is_location {
  if echo "$1" | grep -q '^[[:blank:]]*\#.*$'; then
    return 1
  elif echo "$1" | grep -q '^[[:blank:]]*$'; then
    return 1
  fi

  return 0
}

# Link the dotfiles
while read LINE; do
  if is_location "$LINE"; then
    read -ra FILES <<<"$LINE"

    DOTFILE="$DOTFILES/${FILES[0]}"
    TARGET="$HOME/${FILES[1]}"

    if ! [[ -e "$DOTFILE" ]]; then
      echo "Unable to link ${FILES[0]} at ~/${FILES[1]}. Dotfile does not exist."
    elif [[ -e "$TARGET" ]]; then
      echo "Unable to link ${FILES[0]} at ~/${FILES[1]}. Target already exists."
    else
      echo "Linking ${FILES[0]} at ~/${FILES[1]}..."
      ln -s "$DOTFILE" "$TARGET"
    fi
  fi

done < "$FILE_LOCATIONS"

# Link the bin files
for TOOL in "$PKGTOOLS"/*; do
  TOOL_NAME=`basename "$TOOL"`
  ln -s "$TOOL" "$BIN_DIR/$TOOL_NAME"
done

echo "All links created."

# On Mac OS X we use iTerm2 as our terminal of choice, so configure it to use
# the profile info we have saved in this repo.
echo "Configuring iTerm2..."
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
echo "iTerm2 successfully configured."
