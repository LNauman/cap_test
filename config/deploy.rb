# config valid only for Capistrano 3.1
lock '3.1.0'
set :user, 'deployer'
set :application, 'cap_test'
set :repo_url, "git@github.com:LNauman/#{fetch :application}.git"

set :deploy_to, "/home/#{fetch :user}/www/#{fetch :application}"

set :linked_files, %w{config/database.yml config/application.yml}

set :rbenv_ruby, '2.1.0'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
