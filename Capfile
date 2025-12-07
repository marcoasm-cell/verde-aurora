require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/rbenv"
require "capistrano/rails"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"

require "capistrano3/puma"
install_plugin Capistrano::Puma

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
