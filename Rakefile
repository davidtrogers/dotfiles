require 'rubygems'
require 'rake'
require 'ruby-debug'
require 'json'

ROOT=File.dirname(__FILE__)
VIM_ROOT=ROOT+"/.vim"
NERDTREE=ROOT+"/vendor/nerdtree"
FUGITIVE=ROOT+"/vendor/vim-fugitive"

# I want to:
#   vim
#     cp zipfiles from remote repos/sites
#     unzip said zipfiles in the right place (non-git repos)
#     symlink in vim libs (git repos)
#   source .bash_profile
#

task :default => [:update]

task :update do
  subs = JSON.parse(`cat submodules.json`)
  Dir.chdir('vendor') do
    subs.each do |sub|
      if Dir[sub['path']].empty?
        sh "git clone #{sub['url']} '#{sub['path']}'"
      else
        Dir.chdir(sub["path"]) do
          begin
            sh "git pull #{sub['url']} master"
          rescue Exception => e
            sh "git pull #{sub['url']} #{sub['path']}"
          end
        end
      end
    end
  end

  #NERDtree
  Dir.chdir NERDTREE
  load 'RakeFile'
  Rake::Task['install'].invoke

  #Fugitive
  fugitive = {:plugin => 'fugitive.vim', :doc => 'fugitive.txt'}
  fugitive.each_key {|k| ln_sf("#{FUGITIVE}/#{k}/#{fugitive[k]}", "#{VIM_ROOT}/#{k}/#{fugitive[k]}") }

  ln_sf(ROOT+"/vendor/rtomayko/dotfiles/bin", ROOT+"/vendor/bin")
end
