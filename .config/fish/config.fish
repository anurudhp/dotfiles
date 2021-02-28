### Fish
fish_vi_key_bindings
# set fish_cursor_default block
# set fish_cursor_insert line
# set fish_cursor_replace_one underscore
# set fish_cursor_visual block

set fish_greeting

### Environment variables
set -x CC clang
set -x CXX clang++
set -x EDITOR nvim
set -x FZF_DEFAULT_OPTS "--cycle --ansi --reverse"

### Path
set PATH "$PATH:/usr/local/go/bin"
set PATH "$PATH:/home/linuxbrew/.linuxbrew/bin"
set PATH "$HOME/.cabal/bin:$PATH"
set PATH "$HOME/.elan/bin:$PATH"
set PATH "$HOME/.cargo/bin:$PATH"
set PATH "$PATH:$HOME/.emacs.d/bin"
set PATH "$PATH:$HOME/.local/share/gem/ruby/2.7.0/bin"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

### Aliases
function rm
  command rm -i $argv
end

## use neovim
function vi
  command nvim $argv
end
function vim
  command nvim $argv
end
## Load session (usually used with `:Obsess .vs` to create the session)
function code
  command nvim -S .vs $argv
end

function touchscreen-disable
  xinput disable 'ELAN Touchscreen'
end
function touchscreen-enable
  xinput enable 'ELAN Touchscreen'
end
function keyboard-disable
  xinput set-int-prop (xinput --list | grep "AT Translated Set 2 keyboard" | sed 's/[^=]*=\([1-9]*\).*/\1/') "Device Enabled" 8 0
end
function keyboard-enable
  xinput set-int-prop (xinput --list | grep "AT Translated Set 2 keyboard" | sed 's/[^=]*=\([1-9]*\).*/\1/') "Device Enabled" 8 1
end

function mypy3
  source "$HOME/sources/python3env/bin/activate.fish"
end

function gpp
  g++ -std=c++17 -O2 -DLOCAL_EXEC -Wall -g -fsanitize=address,undefined $argv
end
function fd
  fdfind $argv
end
function dotfiles
  git --git-dir=$HOME/sources/dotfiles --work-tree=$HOME $argv
end

function vscode
  command code $argv
end


