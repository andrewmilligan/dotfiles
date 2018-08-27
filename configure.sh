#!/bin/bash

DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
FILE_LOCATIONS="$DIR/config/file_locations.txt"
DOTFILES="$DIR/dotfiles"

function is_location {
  if echo "$1" | grep -q '^[[:blank:]]*\#.*$'; then
    return 1
  elif echo "$1" | grep -q '^[[:blank:]]*$'; then
    return 1
  fi

  return 0
}

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

echo "All links created."
