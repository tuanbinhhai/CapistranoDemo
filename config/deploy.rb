# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'CapistranoDemo'
set :repository, 'git@github.com:tuanbinhhai/CapistranoDemo.git'

# Default branch is :master
set :branch, "master"
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
set :user, "tuanbinhhai"
set :scm_passphrase, "thanhtuan230493"
set :use_sudo, false
set :rails_env, "development"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 4321 }
set :keep_releases, 5
default_run_options[:pty] = true


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
