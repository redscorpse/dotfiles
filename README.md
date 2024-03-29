# my Dotfiles

## Neovim / Vim

```sh
# using nvim
mv nvim ~/.config/

# for vim
mv nvim ~/.vim && mv ~/.vim/init.vim ~/.vimrc
```

### Plugins

```sh
# inside vim,
[:]PlugInstall
```

- Themes / Visual
  - [gruvbox](https://github.com/morhetz/gruvbox)
  - [indentline](https://github.com/yggdroot/indentline)
  - [vim-code-dark](https://github.com/tomasiser/vim-code-dark)
  - [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- IDE
  - [coc.nvim](https://github.com/neoclide/coc.nvim)
  - [vim-markdown](https://github.com/preservim/vim-markdown)
- Productivity
  - [nerdcommenter](https://github.com/preservim/nerdcommenter)
  - [nerdtree](https://github.com/preservim/nerdtree)
  - [vim-bitoai](https://github.com/zhenyangze/vim-bitoai)
  - [vim-airline](https://github.com/vim-airline/vim-airline)
    - [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- Utilities
  - [auto-pairs](https://github.com/jiangmiao/auto-pairs)
  - [fzf](https://github.com/junegunn/fzf)
  - [tagalong.vim](https://github.com/AndrewRadev/tagalong.vim)
  - [vim-closetag](https://github.com/alvan/vim-closetag)
  - [vim-css-color](https://github.com/ap/vim-css-color)
  - [vim-fugitive](https://github.com/tpope/vim-fugitive)
  - [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
  - [vim-surround](https://github.com/tpope/vim-surround)
  - [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

## tmux

## zsh

```sh
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add Typewritten theme
# source: https://typewritten.dev/#/installation theme
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
sed -i 's/robbyrussell/typewritten\/typewritten/' .zshrc
echo -e "\n\nTYPEWRITTEN_CURSOR='beam'" >> .zshrc

# Add zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' .zshrc
```
