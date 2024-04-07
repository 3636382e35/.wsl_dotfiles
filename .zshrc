# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, 
# [y/n] confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; 
#   then source 
#   "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi 
#
# fonts = martian mono, ia writer mono, fantasque mono

PATH=$PATH:~/nvim-linux64/bin
plugins=( 
    # git
    zsh-autosuggestions
)

# If you come from bash you might have to change your $PATH. 
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#source ~/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded, in which case, to know which specific 
# one was loaded, run: echo $RANDOM_THEME See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="simplerich" 
# ZSH_THEME="norm" 
#ZSH_THEME="agnoster" 
 ZSH_THEME="cypher" 
# ZSH_THEME="clean" 
# ZSH_THEME="intheloop" 
# ZSH_THEME="intika"
# ZSH_THEME="powerlevel10k/powerlevel10k" 

LS_COLORS=$LS_COLORS:'ow=1;34:' ; 

export LS_COLORS # Set list of themes to pick from when loading at random Setting this variable when ZSH_THEME=random will cause zsh to load a theme from this variable # instead of looking in $ZSH/themes/ If set to an empty array, this variable will have no effect. ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" # )
# Uncomment the following line to use case-sensitive completion. CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case-sensitive completion must be off. _ and - will be interchangeable. 
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior zstyle ':omz:update' mode disabled # disable automatic updates zstyle 
# ':omz:update' mode auto # update automatically without asking zstyle ':omz:update' mode reminder # just remind me to update when it's time


# Uncomment the following line to change how often to auto-update (in days). zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up. DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls. DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title. DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction. ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion. You can also set it to another string to have that shown instead of the 
# default red dots. e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f" Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 
# (see #5765) COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large 
# repositories much, much faster. 
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time stamp shown in the history command output. You can set one of the 
# optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or set a custom format using the strftime function format specifications, see 'man 
# strftime' for details. HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom? ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? Standard plugins can be found in $ZSH/plugins/ Custom plugins may be added to $ZSH_CUSTOM/plugins/ Example 
# format: plugins=(rails git textmate ruby lighthouse) Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else export EDITOR='mvim'
# fi

# Compilation flags export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs, plugins, and themes. Aliases can be placed here, though oh-my-zsh users are 
# encouraged to define aliases within the ZSH_CUSTOM folder. For a full list of active aliases, run `alias`.
#
# Example aliases alias zshconfig="mate ~/.zshrc" alias ohmyzsh="mate ~/.oh-my-zsh"
#
# github auth login
alias gh="gh auth login"
alias tm="tmux" alias cyg="cd /mnt/c/cygwin64/home/Dario/" 
alias vim="nvim" 
alias term-config="vim /mnt/c/Users/Dario/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
#alias nvim="nvim-linux64/bin/nvim"
alias lg="rm -rf /mnt/c/cygwin64/home/Dario/Project-Z/Project-Z/.git/index.lock && lazygit" 
alias ls="ls -latr --color" 
alias pip="python3 -m pip" 
alias mp3="yt-dlp -f 'ba' -x --audio-format mp3 ytsearch:" 
alias mp4-best="yt-dlp -f '[ext=mp4]+ba[ext=m4a]/b[ext=mp4]' -o '%(title)s.%(ext)s'" 
alias yt480="yt-dlp -f 'bv*[height<=480]+ba/b[height<=480] / wv*+ba/w'" 
alias _1="/mnt/c/ProgramData/GameMakerStudio2/Cache/runtimes/runtime-2023.8.2.152/bin/igor/windows/x64/Igor.exe -j=8 -options='C:\Users\Dario\AppData\Local\GameMakerStudio2\GMS2TEMP\build.bff' -v -- windows Run" 
alias dd="clear && _1" 
alias gmdir="cd /mnt/c/Users/Dario/Documents/GameMakerStudio2" 
alias pz=" cd ~/Stuffs/Project-Z" 
#alias nvplug="vim ~/.config/nvim/lua/custom/plugins.lua" 
#alias nvconf="vim ~/.config/nvim/lua/custom/init.lua" 
alias tar="tar xzvf" 
alias nf="neofetch" 
alias music-dir="cd /mnt/c/music"
alias cat="batcat"
#wsl tricks
alias open='explorer.exe wslpath -w "$PWD"' 
alias subl="/mnt/c/Users/Dario/Downloads/sublime_text_build_4166_x64/subl.exe"
alias font-patch="~/Stuffs/FontPatcher/font-patcher.exe"
alias ls="eza -lla --group-directories-first"
#
bindkey -s '^f' 'vim $(fzf)\n'
#source ~/.repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 
alias open='explorer.exe'
alias tmux='tmux && tmux source ~/.config/tmux/.tmux.conf'
# cd ~

# install atuin and enable these
# eval "$(atuin init zsh)"
