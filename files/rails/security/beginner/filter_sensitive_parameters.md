## 📝 Filter Sensitive Parameters from Logs
Prevent leaking passwords or tokens by filtering them out of log files. Add parameter keys to `filter_parameters` in the application config.

```ruby
# config/initializers/filter_parameter_logging.rb
Rails.application.config.filter_parameters += [:password, :password_confirmation, :credit_card_number]
```