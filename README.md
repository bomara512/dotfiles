# dotfiles

Collection of dotfiles to help me remember how to set up a mac the way I want. 
Works pretty well on a fresh macos installation. 
Might need some tweaks if trying to introduce to an existing installation.
Heavily inspired by [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles) to begin with then simplified to my specific needs.

## Installation

Clone the repo into the `$HOME` directory. For initial installation and subsequent updates, `cd` into local `dotfiles` repository and then:

```bash
source install.sh
```

This is a pretty short and self-explanatory script which will
- install [oh my zsh](https://ohmyz.sh/) and [Powerlevel10k](https://github.com/romkatv/powerlevel10k/blob/master/README.md)
- install [Homebrew](https://brew.sh/) and formulae specified in the `Brewfile`
- install a specific global python version via [pyenv](https://github.com/pyenv/pyenvhttps://github.com/pyenv/pyenv)
- create symlinks to various source controlled dotfiles using [stow](https://www.gnu.org/software/stow/) [[brief how-to](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)]
- set some sensible macOS defaults 

### Local git customizations

If `~/.gitconfig.local` exists, it will be sourced by the `git/.gitconfig` file. 
This is a good place to put git configurations that you might not want to check into source control.

Example `~/.gitconfig.local` contents:
```bash
[user]
        name = My Name
        email = myemail@example.com
```

### Subsequent runs

The `install.sh` command can be rerun periodically to apply changes or pick up brew updates.

You should also be able to run 

```bash
source brew.sh
```

or 

```bash
source .macos
```

to update the respective configurations independently.

## Thanks to…
https://dotfiles.github.io and especially [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)



