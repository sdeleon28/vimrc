[![Stories in Ready](https://badge.waffle.io/sdeleon28/vimrc.png?label=ready&title=Ready)](https://waffle.io/sdeleon28/vimrc)
# vimrc

My dotfiles.

I'm new to vim. Don't make fun of me -.-

## Installing

Install NeoVim, then do a buncha things.

### Glyphs

First install a patched font from nerd-fonts so that your font looks great and you have the proper glyphs for the icons. **You only need to do this in your local machine** since this will affect your terminal emulator. If you SSH into other boxes from that machine, there's no need to install nerd-fonts in each. If you're on macOS, run:

```bash
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
```

And then set DroidSansMono as the font for your iTerm profile.

If you're on linux, look for instructions on how to install a patched font in [the nerd-fonts README](https://github.com/ryanoasis/nerd-fonts#font-installation).

### Plugins

First install Vundle and vim-plug. Then fire up vim and run `:PluginInstall` and `:PlugInstall`. **TODO:** Migrate everything to vim-plug (or evaluate other options so that I don't change managers every week).

### Colors

I'm using the lucario color theme. In order for it to play nice with iTerm, you have to import some color settings into your iTerm profile. Unfortunately, I didn't document this when I did it, so you might need to google how to do that. **TODO**: Document this process.

