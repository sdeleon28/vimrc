[![Stories in Ready](https://badge.waffle.io/sdeleon28/vimrc.png?label=ready&title=Ready)](https://waffle.io/sdeleon28/vimrc)
# vimrc

My vim dotfiles.

I'm new to vim. Don't make fun of me -.-

## Installing

Install NeoVim, then fire it up and run `:PlugInstall`. If you'll access this machine via a remote connection, you're done! If you're on one of your "main" computers (e.g. the one you'll use to SSH into other boxes), you'll need to install some other things to adjust the aesthetics of your terminal emulator.

### Glyphs

First install a patched font from nerd-fonts so that your font looks great and you have the proper glyphs for the icons. If you're on macOS, run:

```bash
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
```

And then set DroidSansMono as the font for your iTerm profile.

If you're on linux, look for instructions on how to install a patched font in [the nerd-fonts README](https://github.com/ryanoasis/nerd-fonts#font-installation).

If you're on Windows, may the force be with you.

### Colors

I'm using the lucario color theme. In order for it to play nice with iTerm, you have to import some color settings into your iTerm profile. Unfortunately, I didn't document this when I did it, so you might need to google how to do that. **TODO**: Document this process.

