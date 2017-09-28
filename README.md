# My .vim/vimrc


## Setup

1. Clone this repo to '~/.vim:
   ```bash
   # Set up this repo as ~/.vim
   git clone <this-repo> ~/.vim
   ```
2. Set up [pathogen]


## Usage

1. Common config:
   Specific groups of configuration that applies to all hosts goes into
   `~/.vim/plugins/<name>.vim`.
2. Host config:
   Specific settings that applies to specific hosts, goes into
   `~/.vim/hosts/<hostname>.vim`. This config will be loaded if `hostname()`
   matches.
3. Config presets:
   Config presets goes into `~/.vim/presets/<preset>.vim`. If a `:`-separated
   value `<preset>` is present in `$VIM_PRESETS`, this file will get loaded.
   If `$VIM_PRESET` is empty, `presets/common.vim` gets loaded.

Keybindings should be set up in `keys.vim`.


  [pathogen]: https://github.com/tpope/vim-pathogen
