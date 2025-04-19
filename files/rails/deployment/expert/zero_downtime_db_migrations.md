## 🔄 Zero-Downtime DB Migrations

Leverage ActiveRecord’s `disable_ddl_transaction!` combined with algorithm options to execute migrations without blocking your application. Use the Strong Migrations gem or manual techniques to split long‐running changes into safe, granular steps and integrate checks in your CI pipeline to prevent locking.

```ruby
class AddIndexConcurrentlyToUsersEmail < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    add_index :users, :email, algorithm: :concurrently
  end

  def down
    remove_index :users, :email, algorithm: :concurrently
  end
end
```

In your GitLab CI or GitHub Actions pipeline, enforce Strong Migrations checks:

```yaml
# .gitlab-ci.yml
migrations:
  stage: test
  script:
    - bundle exec rake db:migrate:status
    - bundle exec strong_migrations:check
  allow_failure: false
```