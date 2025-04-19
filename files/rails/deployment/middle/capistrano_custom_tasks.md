## 🛫 Automating Deploy with Capistrano Custom Tasks

Capistrano streamlines Rails deployments by letting you define custom tasks for database migrations, asset handling, and service restarts. You can hook into deploy lifecycles (`before`, `after`) to ensure steps run in the proper order, reducing manual intervention. Here’s how to add tasks in your `config/deploy.rb` to migrate and restart seamlessly.

```ruby
# config/deploy.rb
namespace :deploy do
  desc 'Run database migrations'
  task :migrate_db do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:migrate'
        end
      end
    end
  end
  before :updated, :migrate_db

  desc 'Restart application via touch'
  task :restart do
    on roles(:app) do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :publishing, :restart
end
```