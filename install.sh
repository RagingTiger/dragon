# globals
dragonfile="$HOME/.dragonascii"
rcfile="$HOME/.$(basename $SHELL)rc"

# funcs
dragon_ascii() {
  echo "$(curl -fsSL https://git.io/dragon.ascii)"
}

create_file() {
  echo "$1" > $dragonfile
}

append_rc() {
  if cat "$rcfile" | grep "dragonascii" > /dev/null; then
    # pass
    :
  else
    # add to rc file
    printf "\n# dragon ascii\n$1" >> $rcfile
  fi
}

main() {
  # add dragon ascii art to shell config file
  dragon=$(dragon_ascii)

  # creat file
  create_file "$dragon"

  # create echo string
  append_rc "cat $dragonfile"
}


# run main
main
