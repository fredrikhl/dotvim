# Vim dot-files

My vim setup with [pathogen] and [pandemic], with common settings according to
my preferences, and possibility for different configs for individual hosts.

See [doc/dotvim.txt] for more info.

## Setup

1. Clone this repo to '~/.vim:
   ```bash
   git clone <this-repo> ~/.vim
   ```
2. Install [pandemic] and fetch bundles:
   ```bash
   bash setup.py
   ```


## Configuration

The ``~/.vim/vimrc`` is minimal. All it does is:

1. Configure all vim [turds] to be written to
   ~/.vim/{.backup,.swap,.undo,.viminfo}
2. Source configs from ~/.vim/{common,presets,hosts}


  [doc/dotvim.txt]: ./doc/dotvim.txt
  [pathogen]: https://github.com/tpope/vim-pathogen
  [pandemic]: https://github.com/jwcxz/vim-pandemic
  [turds]: https://github.com/apple/darwin-xnu/commit/0a798f6738bc1db01281fc08ae024145e84df927#diff-a084b794bc0759e7a6b77810e01874f2L6
