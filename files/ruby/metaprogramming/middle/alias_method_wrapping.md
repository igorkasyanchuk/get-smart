## 🔄 Wrapping Methods with alias_method

Use `alias_method` to wrap existing methods without monkey-patching. This gives you a safe way to add behavior before or after the original implementation.

```ruby
class Notifier
  def notify(user)
    # original notification logic
    puts "Notifying \\#{user}"
  end

  alias_method :original_notify, :notify

  def notify(user)
    puts "[LOG] About to notify"
    original_notify(user)
    puts "[LOG] Notification sent"
  end
end

Notifier.new.notify('Alice')
```