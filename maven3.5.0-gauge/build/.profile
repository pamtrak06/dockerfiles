
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

if `tty -s`; then
   mesg n
fi
export GAUGE_ROOT=/usr/local/
