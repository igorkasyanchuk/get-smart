## 🐞 Log Debug Messages with Rails.logger

Rails comes with a built-in logger which you can use to print debug messages to the log file or console. This helps you track variable values and the flow of execution without stopping your app.

```ruby
# config/environments/development.rb
Rails.application.configure do
  config.log_level = :debug
end

# in your controller or model
Rails.logger.debug "Current user: #{current_user.inspect}"
```
