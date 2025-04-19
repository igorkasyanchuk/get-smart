## 📦 Lazy Loading Constants with `autoload`

`autoload` defers loading of a module until its constant is first accessed, reducing startup time. It's ideal for large codebases.

```ruby
module Services
  autoload :EmailSender, 'services/email_sender'
  autoload :SmsSender,   'services/sms_sender'
end

# At this point, neither file is loaded yet.
Services::EmailSender.new.send_welcome
# Now 'services/email_sender.rb' is loaded automatically.
```

Remember: `autoload` is thread-unsafe in Ruby versions < 2.3; consider alternatives like `Zeitwerk` in Rails.