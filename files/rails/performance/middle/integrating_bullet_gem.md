## 🕵️‍♂️ Integrate Bullet Gem to Detect N+1

Bullet alerts you to N+1 and unused eager loads in development. Add it to your Gemfile and configure it to log or raise errors.

```ruby
# Gemfile (development group)
gem "bullet"

# config/environments/development.rb
Rails.application.configure do
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
  end
end
```
