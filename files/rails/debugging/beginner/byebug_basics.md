## 🛠️ Pause Execution with byebug

Add the `byebug` gem to your Gemfile and insert `byebug` in your code to halt execution and open an interactive console. This allows you to step through code, inspect variables, and evaluate expressions on the fly.

```ruby
# Gemfile
gem 'byebug', group: :development

# In your code
def update
  byebug
  @user.update(user_params)
end
```
