## ⚙️ Speed Up Asset Precompilation with Parallel Capistrano Tasks

Compiling assets sequentially on a single server can become a bottleneck. You can distribute Rails asset precompilation across multiple app servers by using SSHKit’s concurrency along with Capistrano tasks. This reduces deploy time significantly for large asset pipelines.

Add this task to your Capistrano config:

```ruby
# lib/capistrano/tasks/parallel_assets.rake
namespace :deploy do
  desc 'Compile assets in parallel on app servers'
  task :parallel_assets do
    on roles(:web), in: :groups, limit: 3, wait: 5 do |host|
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :rake, 'assets:precompile'
        end
      end
    end
  end
end

after 'deploy:updated', 'deploy:parallel_assets'
```  

Here, `limit: 3` runs the task on up to three servers concurrently, and `wait: 5` seconds between batches. Adjust those values based on your fleet size. This approach dramatically reduces the wall-clock time for asset compilation on multi-server setups.  
