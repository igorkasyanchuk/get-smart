## 🗑️ Filter Sensitive Parameters from Logs

Prevent sensitive data from appearing in logs by filtering parameters like passwords and credit cards.

```ruby
# config/initializers/filter_parameter_logging.rb
Rails.application.config.filter_parameters += [:password, :credit_card_number]
```
