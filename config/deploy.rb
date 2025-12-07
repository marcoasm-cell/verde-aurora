lock "~> 3.18.0"

set :application, "verde-aurora"
set :repo_url, "https://marcomarques:coffee_please@gitlab.projectbox.pt/dg/gamification/gamification-backend.git"
set :deploy_to, "/var/www/#{fetch(:application)}/#{fetch(:stage)}"

append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "storage", "public/uploads", ".bundle", "node_modules"

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '3.4.2'