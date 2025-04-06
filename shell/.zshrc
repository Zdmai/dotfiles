# User configuration
# Homebrew setup
if [[ $(uname -m) == 'arm64' ]]; then
    BREWPATH=/opt/homebrew/bin
else
    BREWPATH=/usr/local/bin
fi
export PATH=$BREWPATH:$PATH

# llvm
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"



# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR=vim
# else
#   export EDITOR=nvim
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# use vi in zsh
set -o vi       # when you set, you won't use ctrl-a and ctrl-b

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
# some more ls aliases
alias ls='eza'
alias ll='eza -l --git'
alias la='eza -a'
alias l='eza'

alias ginit='git init && echo "**/.DS_Store" > .gitignore'

alias cat="bat"
# alias find="fd"
alias grep="rg"
# alias ps="procs"

alias g='git'
alias ga='git add'
alias gpu='git push'
alias gb='git branch'
alias gs='git status'
alias gc='git checkout'
alias lg='lazygit'

# alias t='tmux'

alias v='nvim'
alias v.='nvim .'
alias vb='nvim ~/.zshrc'
alias vt='nvim ~/.tmux.conf'
alias v,='cd ~/.config/nvim && nvim ~/.config/nvim'

alias sb='source ~/.zshrc'
alias biye='conda activate biye'
alias sp='source .venv/bin/activate'
alias da='deactivate'

alias c='clear'

alias p='python'
alias doc='pydoc'

alias ssh="TERM=xterm-256color ssh"

alias gt="ghostty"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/etc/profile.d/z.sh

# # change the lima default name 
# export LIMA_INSTANCE=debian
#
# alias listop='limactl stop debian'
# alias listart='limactl start debian'

# export XDG_CONFIG_HOME="~/.config/"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"


export CMAKE_PREFIX_PATH="/usr/local/opt/qt@5"

# update yabai when upgrade it 
# alias yup='~/.bin/yabai_update.sh'

# update the outdated packages
# function brew() {
#   command brew "$@" 
#
#   if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
#     sketchybar --trigger brew_update
#     ~/.bin/yabai_update.sh
#   fi
# }

# config the yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Using fd with fzf
export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use my own bash file
export PATH=$PATH:~/.bin
export PATH="$HOME/.local/bin:$PATH"


# Goerge Hotz's config
export CLICOLOR=1
# export PS1=$'\u@\h:\[\e[33m\]\w\[\e[0m\]\$ '
# export EDITOR='vim'
# George Hotz's config

# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.
# export DISPLAY=:0


export TLDR_AUTO_UPDATE_DISABLED=true
#
# add the mojo to the PATH
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

#
# better man page
#
# export LESS=-R
# export LESS_TERMCAP_mb=$'\e[1;31m'
# export LESS_TERMCAP_md=$'\e[1;31m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[01;44;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;32m'
#
# use nvim 
export MANPAGER='nvim +Man!'

# enable the fuck command
eval $(thefuck --alias)

eval $(uv generate-shell-completion zsh)

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color '#20F8C0'

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure

# command for spotlight
# mdutil
