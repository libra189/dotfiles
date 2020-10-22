# migration .bash_profile
source ~/.bash_profile

# zsh settings
autoload -Uz colors && colors

setopt auto_cd
setopt auto_pushd
setopt nobeep
setopt correct

# direnv setting
eval "$(direnv hook zsh)"

# プロンプトデフォルト設定
#PROMPT="%m:%c %n$ "

# 補完候補の表示・選択
autoload -Uz compinit && compinit
setopt auto_menu
setopt auto_list
# 補完侯補をメニューから選択する。
# select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
# 補完候補に色を付ける。
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# オプションにセパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# 履歴を共有
setopt share_history
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100
# 重複を記録しない
setopt hist_ignore_dups
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 履歴をインクリメンタルに追加
setopt inc_append_history
# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# powerline-status
export PY_REPO_ROOT="${HOME}/.pyenv/versions/3.8.0/lib/python3.8/site-packages"
powerline-daemon -q
if [[ -r ${PY_REPO_ROOT}/powerline/bindings/zsh/powerline.zsh ]]; then
    source ${PY_REPO_ROOT}/powerline/bindings/zsh/powerline.zsh
fi

