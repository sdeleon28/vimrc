# vimrc

My dotfiles.

I'm new to vim. Don't make fun of me -.-

## Installing

### Vim version

Syntastic causes problems with the newest Vim. Make sure to install version 7.4.1589 instead.

This is how I installed it on macOS:

```
brew unlink vim
brew install https://raw.githubusercontent.com/Homebrew/homebrew/7746a5509b3fb10216f1d40ab639398e8d0c5e4c/Library/Formula/vim.rb
brew unlink macvim
brew switch vim 7.4.1589
```

Source: https://superuser.com/questions/1059194/vim-syntastic-not-jumping-to-the-error/1059421

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

### Compiled Components

Install [YouCompleteMe](Valloric/YouCompleteMe) (steps vary in each platform).

### Colors

Your theme won't work until you install the color scheme. After installing [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) (which is already installed if you already ran `:PluginInstall`), you need to copy the color scheme, like so:

```bash
mkdir -p ~/.vim/colors/
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
```

