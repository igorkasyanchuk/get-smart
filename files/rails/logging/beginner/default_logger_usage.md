## 📝 Using the Default Rails Logger
Rails provides a built-in logger accessible via `Rails.logger`. You can call it anywhere in your application—controllers, models, or background jobs—to record messages with various severity levels.

```ruby
# Anywhere in Rails (controllers, models, jobs)
Rails.logger.info "Hello, Rails logging!"
Rails.logger.warn "This is a warning message"
Rails.logger.error "An error occurred"
```
