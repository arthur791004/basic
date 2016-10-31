# NeoBundle

## 安裝
### 自動安裝
```bash
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
$ sh ./install.sh
```

### 手動安裝
1. 建立 bundle 目錄
```bash
$ mkdir -p ~/.vim/bundle
```
2. 下載 NeoBundle Plugin
```bash
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
3. 於 .vimrc 最下方新增以下程式碼
```bash
	......
	if has('vim_starting')
	   set nocompatible               " Be iMproved
	   set runtimepath+=~/.vim/bundle/neobundle.vim/
	endif
	
	call neobundle#rc(expand('~/.vim/bundle/'))
	
	" Let NeoBundle manage NeoBundle
	NeoBundleFetch 'Shougo/neobundle.vim'
	
	" Recommended to install
	" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
	NeoBundle 'Shougo/vimproc'
	
	" My Bundles here:
	"
	" Note: You don't set neobundle setting in .gvimrc!
	" Original repos on github

	" -> TO DO &lt;-
	
	filetype plugin indent on     " Required!
	"
	" Brief help
	" :NeoBundleList          - list configured bundles
	" :NeoBundleInstall(!)    - install(update) bundles
	" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
	
	" Installation check.
	NeoBundleCheck
```
4. 請於 -> TO Do <- 中加入欲安裝的套件，套件路徑請參考 GitHub 上的 Vim Plugins 網址
   * 例如 nerdtree 的網址為 https://github.com/scrooloose/nerdtree 其套件路徑即為 'scrooloose/nerdtree'。
   ```bash
   " 例如：
	 NeoBundle 'othree/html5.vim'
	 NeoBundle 'BBCode--Dahn'
	 NeoBundle 'plasticboy/vim-markdown'
	 ......
   ```

## 常用外掛
| 名稱 | 描述 |
| ---- | ----- |
| Shougo/vimproc |  |
| Shougo/unite.vim |  |
| Shougo/neocomplcache.vim| 自動補全 |
| scrooloose/nerdtree | 目錄樹 |
| scrooloose/syntastic |  |
| terryma/vim-multiple-cursors | 多行游標 |
| tpope/vim-commentary | 注釋 |
| nathanaelkane/vim-indent-guides |  |
| Valloric/YouCompleteMe |  |
| Lokaltog/vim-powerline |  |
| tpope/vim-fugitive |  |
| othree/eregex.vim |  |
| Yggdroot/indentLine |  |
|  |  |

## Reference
* https://github.com/Shougo/neobundle.vim
* https://github.com/chusiang/vimrc
* https://chusiang.gitbooks.io/working-on-gnu-linux/content/12.vim-plugin-neobundle.html
* https://www.linuxzen.com/tui-jian-ji-kuan-zui-jin-fa-xian-fei-chang-ku-de-vimcha-jian.html
