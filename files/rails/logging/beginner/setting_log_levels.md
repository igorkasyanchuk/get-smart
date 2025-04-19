## 🚦 Setting Log Levels
By default, Rails logs everything at `:debug` level and above in development. You can change this in your environment configuration to reduce verbosity.

```ruby
# config/environments/development.rb
Rails.application.configure do
  config.log_level = :info  # Available levels: :debug, :info, :warn, :error, :fatal, :unknown
end

# Now only info and above will be logged
Rails.logger.debug "This won't appear"
Rails.logger.info  "This will appear"
```
