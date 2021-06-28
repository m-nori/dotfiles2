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
set -x LANG ja_JP.UTF-8

#-----------------------------------------------------------------
# エイリアス設定
#-----------------------------------------------------------------
alias ls='ls -G'
alias ll='ls -tlr'
alias which='type -path'
alias nvim='reattach-to-user-namespace -l nvim'
alias vi='nvim'
alias reload='. ~/.config/fish/config.fish'

#-----------------------------------------------------------------
# fish設定
#-----------------------------------------------------------------
# プロンプト
#omf theme bobthefish
omf theme shellder
set -g theme_color_scheme base16-light

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

# pyenv
set PYENV_SHELL fish
# . '/usr/local/Cellar/pyenv/1.0.10_1/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    . (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end
