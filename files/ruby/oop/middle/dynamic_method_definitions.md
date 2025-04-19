## 🛠️ Define Methods Dynamically with `define_method`

When similar methods differ only by name or behavior, avoid repetition by defining them programmatically. This keeps your code concise and reduces maintenance.

```ruby
class Notifier
  %w[email sms push].each do |channel|
    define_method("notify_#{channel}") do |message|
      puts "Sending \\#{message} via #{channel.upcase}"
    end
  end
end

notifier = Notifier.new
notifier.notify_email("Hello") # Sending Hello via EMAIL
notifier.notify_sms("Hi")     # Sending Hi via SMS
```