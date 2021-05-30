# dotfiles

Collection of dotfiles to set up my mac the way I want.

See https://dotfiles.github.io and [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles) for more general purpose dotfile management ideas.

## Installation

Clone the repo. For initial installation and subsequent updates, `cd` into local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

This will update the local repo and then copy the dotfiles to `$HOME`.

### Optional ~/.path file

If `~/.path` exists, it will be sourced along with the other files.

Example `~/.path` contents:
```bash
export PATH="/usr/local/bin:$PATH"
```

### Optional ~/.extra file

If `~/.extra` exists, it will be sourced along with the other files. Good for adding commands you don’t want to commit to a public repository.

Example `~/.extra` contents:
```bash
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

### Sensible macOS defaults

Set some sensible macOS defaults:

```bash
./.macos
```

### Homebrew formulae

Install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

## Thanks to…
[Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
