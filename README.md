This is my all in one, pure Lua NeoVim configuration.

_Warning_: This is best used as a reference.

Currently, I don't plan to maintain this like a "configuration distribution".
Rather, this is my personal, curated experience that you might also like.
But there are no releases, no breaking change contracts, and minimal support.

Regardless, if you have a question, feel free to open an issue, pull request, or discussion!

---

## Pre-req

1. Make sure you have Neovim installed on your system. This can easily be done
via the [managed pacakge installation](https://github.com/neovim/neovim/wiki/Installing-Neovim) (like with `brew` or `apt`).

```
sudo apt install neovim
```

You'll need a newer version of Nvim (at least 0.9):
```
$ nvim --version
NVIM v0.9.1
Build type: Release
LuaJIT 2.1.0-beta3

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/opt/homebrew/Cellar/neovim/0.9.1/share/nvim"

Run :checkhealth for more info

```

## Quickstart

1. (Optional) Backup your existing Neovim configuration

```sh
cp -r ~/.config/nvim/ ~/.config/nvim-backup/
```

2. Clone this repository into your `~/.config/nvim` directory

```sh
git clone https://github.com/jpmcb/nvim-lua-conf.git ~/.config/nvim
```

3. Make sure you have Packer installed on your system. You can read more about
Packer, installation, and how it works [in their docs](https://github.com/wbthomason/packer.nvim)

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

But just in case, Packer _does_ install itself automatically if it's not already present.
But be aware that this flow sort of sucks: on first running Nvim after it automatically installs itself,
packer _returns a ton of errors_ (since the plugin syncing step hasn't been executed yet).

4. Start a new Neovim session and run Packer sync to get all the plugins

```
:PackerSync
```
---

_Lua oh Lua  
Help configure NeoVim  
Lua oh Lua_  

