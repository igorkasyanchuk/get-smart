## ⚙️ Configure Per-Environment Log Levels
Adjusting log verbosity per environment helps reduce noise in production and get detailed logs in development. Simply set `config.log_level` in each environment config.

```ruby
# config/environments/development.rb
Rails.application.configure do
  config.log_level = :debug   # verbose logs for debugging
end

# config/environments/production.rb
Rails.application.configure do
  config.log_level = :info    # skip debug statements in production
end
```

Available levels are `:debug`, `:info`, `:warn`, `:error`, and `:fatal`. Pick the one that balances insight and performance.