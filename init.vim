"vunlde.vimで管理してるpluginを読み込む
source ~/dotfiles2/.vimrc.dein_nvim
"基本設定
source ~/dotfiles2/.vimrc.basic
"StatusLine設定
source ~/dotfiles2/.vimrc.statusline
"インデント設定
source ~/dotfiles2/.vimrc.indent
"表示関連
source ~/dotfiles2/.vimrc.apperance
"補完関連
source ~/dotfiles2/.vimrc.completion
"Tags関連
source ~/dotfiles2/.vimrc.tags
"検索関連
source ~/dotfiles2/.vimrc.search
"移動関連
source ~/dotfiles2/.vimrc.moving
"Color関連
source ~/dotfiles2/.vimrc.colors
"編集関連
source ~/dotfiles2/.vimrc.editing
"エンコーディング関連
source ~/dotfiles2/.vimrc.encoding
"その他
source ~/dotfiles2/.vimrc.misc
"プラグインに依存するアレ
source ~/dotfiles2/.vimrc.plugins_setting

" for NeoVim
if has('nvim')
  set termguicolors
  " set clipboard+=unnamedplus
  set clipboard=unnamed
  set sh=fish
  tnoremap <silent> <ESC> <C-\><C-n>
  map <Leader>t :terminal<CR>
endif

