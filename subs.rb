#!/usr/bin/env ruby
str = <<-STR
[submodule ".vim/bundle/Google-translator.git"]
	path = .vim/bundle/Google-translator.git
	url = https://github.com/vim-scripts/Google-translator.git
[submodule ".vim/bundle/ShowLine.vim"]
	path = .vim/bundle/ShowLine.vim
	url = https://github.com/vim-scripts/ShowLine.vim.git
[submodule ".vim/bundle/ctrlp.vim"]
	path = .vim/bundle/ctrlp.vim
	url = https://github.com/vim-scripts/ctrlp.vim.git
[submodule ".vim/bundle/jslint.vim"]
	path = .vim/bundle/jslint.vim
	url = https://github.com/hallettj/jslint.vim.git
[submodule ".vim/bundle/vim-addon-mw-utils"]
	path = .vim/bundle/vim-addon-mw-utils
	url = https://github.com/MarcWeber/vim-addon-mw-utils.git
[submodule ".vim/bundle/vim-fugitive"]
	path = .vim/bundle/vim-fugitive
	url = https://github.com/tpope/vim-fugitive.git
[submodule ".vim/bundle/vim-ruby-debugger"]
	path = .vim/bundle/vim-ruby-debugger
	url = https://github.com/astashov/vim-ruby-debugger.git
[submodule ".vim/bundle/nerdtree"]
	path = .vim/bundle/nerdtree
	url = https://github.com/scrooloose/nerdtree.git
[submodule ".vim/bundle/vim-buffergator"]
	path = .vim/bundle/vim-buffergator
	url = https://github.com/jeetsukumaran/nerdtree.git
[submodule ".vim/bundle/vim-git"]
	path = .vim/bundle/vim-git
	url = https://github.com/tpope/vim-git.git
[submodule ".vim/bundle/vim-git-branch-info"]
	path = .vim/bundle/vim-git-branch-info
	url = https://github.com/taq/vim-git-branch-info.git
[submodule ".vim/bundle/vim-ruby-refactoring"]
	path = .vim/bundle/vim-ruby-refactoring
	url = https://github.com/ecomba/vim-ruby-refactoring.git
[submodule ".vim/bundle/ack.vim"]
	path = .vim/bundle/ack.vim
	url = https://github.com/mileszs/ack.vim.git
[submodule ".vim/bundle/snipmate-snippets"]
	path = .vim/bundle/snipmate-snippets
	url = https://github.com/scrooloose/snipmate-snippets.git
[submodule ".vim/bundle/vim-bundler"]
	path = .vim/bundle/vim-bundler
	url = https://github.com/tpope/vim-bundler.git
[submodule ".vim/bundle/vim-haml"]
	path = .vim/bundle/vim-haml
	url = https://github.com/tpope/vim-haml.git
[submodule ".vim/bundle/snipmate.vim"]
	path = .vim/bundle/snipmate.vim
	url = https://github.com/msanders/snipmate.vim.git
[submodule ".vim/bundle/command-t"]
	path = .vim/bundle/command-t
	url = https://github.com/wincent/Command-T.git
[submodule ".vim/bundle/tComment"]
	path = .vim/bundle/tComment
	url = https://github.com/vim-scripts/tComment.git
[submodule ".vim/bundle/vim-coffee-script"]
	path = .vim/bundle/vim-coffee-script
	url = https://github.com/kchmck/vim-coffee-script.git
[submodule ".vim/bundle/vim-javascript"]
	path = .vim/bundle/vim-javascript
	url = https://github.com/pangloss/vim-javascript.git
[submodule ".vim/bundle/vim-surround"]
	path = .vim/bundle/vim-surround
	url = https://github.com/tpope/vim-surround.git
[submodule ".vim/bundle/taglist.vim"]
	path = .vim/bundle/taglist.vim
	url = https://github.com/vim-scripts/taglist.vim.git
[submodule ".vim/bundle/vim-commentary"]
	path = .vim/bundle/vim-commentary
	url = https://github.com/tpope/vim-commentary.git
[submodule ".vim/bundle/vim-rails"]
	path = .vim/bundle/vim-rails
	url = https://github.com/tpope/vim-rails.git
[submodule ".vim/bundle/vimwiki"]
	path = .vim/bundle/vimwiki
	url = https://github.com/vim-scripts/vimwiki.git
[submodule ".vim/bundle/gist-vim"]
	path = .vim/bundle/gist-vim
	url = https://github.com/mattn/gist-vim.git
[submodule ".vim/bundle/tlib_vim"]
	path = .vim/bundle/tlib_vim
	url = https://github.com/tomtom/tlib_vim.git
[submodule ".vim/bundle/vim-endwise"]
	path = .vim/bundle/vim-endwise
	url = https://github.com/tpope/vim-endwise.git
[submodule ".vim/bundle/vim-ruby"]
	path = .vim/bundle/vim-ruby
	url = https://github.com/vim-ruby/vim-ruby.git
STR

require 'rubygems'
require 'fileutils'
require 'enumerator'
require 'awesome_print'

arr = []
str.lines {|s| arr << s.chomp }

until arr.empty? do
  submodule = arr.shift(3)
  sub_name = submodule[0].split[-1].chomp(']').gsub('"','')
  path = submodule[1].split.last
  url = submodule[2].split.last

  p path
  p url

  `git submodule add #{url} #{path}`
end
