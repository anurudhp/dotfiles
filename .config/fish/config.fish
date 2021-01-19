### Fish
fish_vi_key_bindings
# set fish_cursor_default block
# set fish_cursor_insert line
# set fish_cursor_replace_one underscore
# set fish_cursor_visual block

set fish_greeting

### Environment variables
set EDITOR nvim
set CC clang
set CXX clang++
set FZF_DEFAULT_OPTS "--cycle --ansi --reverse"

### Path
set PATH "$PATH:/usr/local/go/bin"
set PATH "$PATH:/home/linuxbrew/.linuxbrew/bin"
set PATH "$HOME/.cabal/bin:$PATH"
set PATH "$HOME/.elan/bin:$PATH"
set PATH "$HOME/.cargo/bin:$PATH"
set PATH "$PATH:$HOME/.emacs.d/bin"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

### Aliases
function vi
  command nvim $argv
end
function vim
  command nvim $argv
end
# Load session
function code
  command nvim -S $argv
end

function ls
  command ls --color=auto $argv
end

function rm
  command rm -i $argv
end

function touchscreen-enable
  xinput enable 'ELAN Touchscreen'
end

function touchscreen-disable
  xinput disable 'ELAN Touchscreen'
end

function mypy3
  source "$HOME/Documents/coding/python3env/bin/activate.fish"
end

function gpp
  g++-8 -std=c++17 -O2 -DLOCAL_EXEC -Wall -g -fsanitize=address,undefined $argv
end
function fd
  fdfind $argv
end
function dotfiles
  git --git-dir=$HOME/Documents/misc/dotfiles --work-tree=$HOME $argv
end

