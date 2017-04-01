# vimrc

My dotfiles.

I'm new to vim. Don't make fun of me -.-

## Installing

Install NeoVim, then do a buncha things.

### Glyphs

First install a patched font from nerd-fonts so that your font looks great and you have the proper glyphs for the icons. **You only need to do this in your local machine** since this will affect your terminal emulator. If you SSH into other boxes from that machine, there's no need to install nerd-fonts in each. Run:

```bash
cd ~/vim/
mkdir nerd-fonts
cd nerd-fonts
svn checkout https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/Hack
wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh
./install.sh Hack
```

### Plugins

First install Vundle. Then fire up vim and run `:PluginInstall`. That will install all plugins except for compiled components.

### Colors

Your theme won't work until you install the color scheme. After installing [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) (which is already installed if you already ran `:PluginInstall`), you need to copy the color scheme, like so:

```bash
mkdir -p ~/.vim/colors/
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
```

