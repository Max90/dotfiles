#!/bin/sh
cd $(dirname $0)
for dotfile in $(ls -A); do
  case $dotfile in
    ..)
      continue;;
    .git)
      continue;;
    README.md)
      continue;;
    setup.sh)
      continue;;
    *)
      ln -Fis "$PWD/$dotfile" $HOME;;
  esac
done

# create simlinks
ln -s ~/.dotfiles/.conky/conky_start ~/bin/conky_start
ln -s ~/.dotfiles/.conky/conky_start ~/.kde4/Autostart/conky_start
ln -s ~/.dotfiles/.scripts/r_log.sh ~/.kde4/Autostart/r_log.sh
  # no cookies
rm -rf ~/.macromedia ~/.adobe
ln -s /dev/null ~/.macromedia
ln -s /dev/null ~/.adobe
