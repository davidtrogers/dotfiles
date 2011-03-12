require 'rubygems'
require 'rake'
require 'ruby-debug'
require 'json'

ROOT=File.dirname(__FILE__)
VIM_ROOT=ROOT+"/.vim"
NERDTREE=ROOT+"/vendor/nerdtree"
FUGITIVE=ROOT+"/vendor/vim-fugitive"

# I want to:
#   [Done] git submodule foreach update
#   vim
#     cp zipfiles from remote repos/sites
#     unzip said zipfiles in the right place (non-git repos)
#     symlink in vim libs (git repos)
#   source .bash_profile
#

task :default => [:update]

task :update do
  # puts `git submodule foreach update`
  Dir.chdir(ROOT+'/vendor')
  subs = JSON.parse(`cat submodules.json`)
  subs.each do |sub|
    mkdir_p sub["path"]
    `git clone #{sub["url"]}`
    cd sub["path"]
    `git pull origin master`
  end

  #NERDtree
  Dir.chdir NERDTREE
  load 'RakeFile'
  Rake::Task['install'].invoke

  #Fugitive
  fugitive = {:plugin => 'fugitive.vim', :doc => 'fugitive.txt'}
  fugitive.each_key {|k| ln_sf("#{FUGITIVE}/#{k}/#{fugitive[k]}", "#{VIM_ROOT}/#{k}/#{fugitive[k]}") }
end
