# /var/www/myapp/config/puma.rb
environment "production"
bind "tcp://127.0.0.1:3001"
pidfile "/var/www/verde-aurora/tmp/pids/puma.pid"
state_path "/var/www/verde-aurora/tmp/pids/puma.state"
stdout_redirect "/var/www/verde-aurora/log/puma.stdout.log", "/var/www/verde-aurora/log/puma.stderr.log", true
workers 2
threads 1, 6
preload_app!
