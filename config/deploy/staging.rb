server '107.170.19.170', user: fetch(:user), roles: %w{web app db}

set :rails_env, 'production'
