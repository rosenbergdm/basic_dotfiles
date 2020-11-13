# ~/.profile: executed by Bourne-compatible login shells.
# BASIC_CONFIG


if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
