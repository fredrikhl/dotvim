# Vim dot-files

## Setup

1. Clone this repo to '~/.vim:
   ```bash
   git clone <this-repo> ~/.vim
   ```
2. Set up [pathogen]


## Usage

1. Common settings:
   Specific groups of configuration that applies to all hosts goes into
   `~/.vim/plugins/<name>.vim`.
2. Host settings:
   Specific settings that applies to specific hosts, goes into
   `~/.vim/hosts/<hostname>.vim`. This file will be loaded if `hostname()`
   matches.
3. Setting presets:
   Setting presets goes into `~/.vim/presets/<preset>.vim`. If a `:`-separated
   value `<preset>` is present in `$VIM_PRESETS`, this file will get loaded.
   If `$VIM_PRESET` is empty, `presets/common.vim` gets loaded.

Keybindings should be set up in `keys.vim`.


  [pathogen]: https://github.com/tpope/vim-pathogen
