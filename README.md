# My dotfiles

This directory contains the dotfiles for my system.
I use GNU stow to create symlinks between this and the home repo (for dotfile management

## Requirements
I describe here the macOS package management, please adapt to your OS (ubuntu -> apt, arch -> pacman, ...)

### git
```
brew install git
```

### GNU stow
```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git
```
$ git clone git@github.com:nicolascibids/dotfiles.git
$ cd dotfiles
```

Then, use GNU stow to create symlinks between the dotfiles in the repo and your $HOME directory
```
$ stow .
```

source: https://youtube.com/watch?v=y6XCebnB9gs&si=y7LG_fqFOlMxgZBv
