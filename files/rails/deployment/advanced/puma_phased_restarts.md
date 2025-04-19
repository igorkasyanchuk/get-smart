## 🚀 Zero-Downtime Deploys with Puma Phased Restarts

When you need to push code without dropping connections, Puma’s phased restart feature lets you reload your Rails app in place. By integrating this with Capistrano, you can perform a `phased-restart` during your deploy, ensuring new worker processes boot with fresh code while old ones finish serving existing requests.

In your `config/puma.rb`, enable phased restarts:

```ruby
# config/puma.rb
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# allow phased restarts
plugin :tmp_restart
```

Then add a Capistrano task to call it:

```ruby
# lib/capistrano/tasks/puma_phased.rake
namespace :puma do
  desc 'Phased restart Puma'
  task :phased_restart do
    on roles(:app) do
      execute :bundle, :exec, :pumactl, '-S', shared_path.join('tmp/pids/puma.state'), 'phased-restart'
    end
  end
end

after 'deploy:publishing', 'puma:phased_restart'
```

This setup triggers Puma to spin up new workers with the updated code while letting existing workers drain connections gracefully.  
