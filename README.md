This is my all in one, pure Lua NeoVim configuration.

_Warning_: This is best used as a reference.
Currently, I don't plan to maintain this like a "configuration distribution".
Rather, this is my personal, curated experience that you might also like.
But there are no releases, no breaking change contracts, and minimal support.
Regardless, if you have a question, feel free to open an issue, pull reqeust, or discussion!

---

## Pre-req

1. Make sure you have NeoVim installed on your system. This can easily be done
via the [managed pacakge installation](https://github.com/neovim/neovim/wiki/Installing-Neovim) (like with `brew` or `apt`).

```
sudo apt install neovim
```

## Quickstart

1. (Optional) Backup your existing NeoVim configuration

```sh
cp -r ~/.config/nvim/ ~/.config/nvim-backup/
```

2. Clone this repository into your `~/.config/nvim` directory

```sh
git clone https://github.com/jpmcb/nvim-lua-conf.git ~/.config/nvim
```

3. Make sure you have Packer installed on your system. You can read more about
Packer, intallation, and how it works [in their docs](https://github.com/wbthomason/packer.nvim)

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

But just in case, Packer _does_ install itself automatically if it's not already present.
But be aware that this flow sort of sucks: on first running Nvim after it automatically installs itself,
packer _return a ton of errors_ (since the next step hasn't been executed yet).

4. Start a new NeoVim session and run Packer sync to get all the plugins

```
:PackerSync
```
---

_Lua oh Lua  
Help configure NeoVim  
Lua oh Lua_  

