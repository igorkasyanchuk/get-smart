## 🚫 Skipping Callbacks with `skip_callback`
In tests or special workflows, you can skip callbacks to bypass side effects. Use `skip_callback` carefully to avoid hiding important model logic.

```ruby
# In a test setup
User.skip_callback(:create, :after, :send_welcome_email)
user = User.create!(email: 'test@example.com')

# Re-enable later if needed
User.set_callback(:create, :after, :send_welcome_email)
```

This approach prevents the `send_welcome_email` callback from firing during test creation.