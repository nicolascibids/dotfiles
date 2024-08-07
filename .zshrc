# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fino-time"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom bindkey
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# Google Cloud credentials for user nicolas - used by Gcloud python sdk
export GOOGLE_APPLICATION_CREDENTIALS=/Users/nicolasp/.config/gcloud/application_default_credentials.json
export GOOGLE_CLOUD_PROJECT="noted-victory-133614"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias python="/opt/homebrew/bin/python3.10"
# Python venv - rtb optimizer by default
echo "Hello there ! What can I do for you ?"

# To put in a function for setup
rtbenv_setup() {
    export PYTHONPATH="/Users/nicolasp/rtboptimizer1"
    export PYTHONPATH="${PYTHONPATH}:/Users/nicolasp/python_scibids_lib"
    source ~/virtualenvs/rtbenv2/bin/activate
}
rtbenv_setup

# Function ---------------
# Custom command (= aliases with args)
pacing_insight(){
    cd ~/rtboptimizer1
    python tool/otto/insights/pacing_insight.py $1 nicolas/pacing_tool/insights/pacing/ $2 $3 $4
    cd ~/rtboptimizer1/nicolas/pacing_tool/insights/pacing/
}
model_insight(){
    cd ~/rtboptimizer1
    python tool/otto/insights/model_insight.py $1 nicolas/pacing_tool/insights/model/ $2 --algo bm $3 $4
    cd ~/rtboptimizer1/nicolas/pacing_tool/insights/model/
}

pacing_insight_diageo(){
	pacing_insight TheTradeDesk $1 $2 $2 && open TheTradeDesk_cbcvsmp/io_$1_None
}

pacing_insight_DBM(){
    cd ~/rtboptimizer1
    python tool/otto/insights/pacing_insight.py DBM nicolas/pacing_tool/insights/pacing/ $1 $2 $3 --algo $4
    cd ~/rtboptimizer1/nicolas/pacing_tool/insights/pacing/
}
model_insight_DBM(){
    cd ~/rtboptimizer1
    python tool/otto/insights/model_insight.py DBM nicolas/pacing_tool/insights/model/ $1 $2 $3 --algo $4
    cd ~/rtboptimizer1/nicolas/pacing_tool/insights/model/ 
}

trueview_insight(){
    cd ~/rtboptimizer1
    python tool/otto/insights/trueview_insight.py nicolas/pacing_tool/insights/pacing/ $1 $2 $3 $4
    cd ~/rtboptimizer1/nicolas/pacing_tool/insights/pacing/
}


# Kubernetes
function getCronJobImagesAndNames() {
    # Set namespace to "default" if not provided
    labelSelector=$1
    namespace=${2:-default}
    kubectl get cronjobs -n "$namespace" -l "$labelSelector" -o=jsonpath='{range .items[*]}{.metadata.name}{"\n"}{range .spec.jobTemplate.spec.template.spec.containers[*]}{.name}{": "}{.image}{"\n"}{end}{end}'
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicolasp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nicolasp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nicolasp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nicolasp/google-cloud-sdk/completion.zsh.inc'; fi


# Aliases -----------------------------------------------------------------------------------------------
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
# export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"
