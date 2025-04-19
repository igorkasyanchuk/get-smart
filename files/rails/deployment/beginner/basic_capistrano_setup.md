## ⚙️ Basic Capistrano Setup
Capistrano automates deployments over SSH with simple configuration. This example shows a minimal setup for pushing your Rails code to a VPS in the `production` stage.

```ruby
# Add these gems to your Gemfile in development group:
group :development do
  gem 'capistrano', '~> 3.16'
  gem 'capistrano-rails', '~> 1.6'
  gem 'capistrano-passenger', '~> 0.2.0'
end
```

After bundling, install Capistrano:

```bash
bundle exec cap install STAGES=production
```

Edit `config/deploy.rb`:

```ruby
lock '~> 3.16.0'
set :application, 'my_rails_app'
set :repo_url, 'git@github.com:username/my_rails_app.git'
set :deploy_to, '/var/www/my_rails_app'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
```

Then deploy:

```bash
bundle exec cap production deploy
```