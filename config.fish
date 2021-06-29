#-----------------------------------------------------------------
# PATH
#-----------------------------------------------------------------
set -x PATH /usr/local/bin $PATH
set -x PATH $HOME/.pyenv/shims $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/Tools $PATH

#-----------------------------------------------------------------
# 環境変数
#-----------------------------------------------------------------
export LSCOLORS=xbfxcxdxbxegedabagacad
set -x LANG C.UTF-8

#-----------------------------------------------------------------
# エイリアス設定
#-----------------------------------------------------------------
alias ll='ls -tlr'
alias which='type -path'
alias vi='nvim'
alias reload='. ~/.config/fish/config.fish'

#-----------------------------------------------------------------
# fish設定
#-----------------------------------------------------------------
# プロンプト
omf theme bobthefish

# 移動履歴
function _peco_change_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    builtin cd $foo
  else
    commandline ''
  end
end
function peco_change_directory
  begin
    sort -r -t '|' -k 3 ~/.z|sed -e 's/\|.*//'
    echo $HOME/Downloads
    echo $HOME/Documents
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
function fish_user_key_bindings
end

# 履歴移動
set fish_plugins theme peco

# キーバインド
function fish_user_key_bindings
  bind \c] peco_change_directory # Bind for prco change directory to Ctrl+]
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

