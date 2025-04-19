## ⚙️ Craft Custom Callback Chains Beyond ActiveRecord
ActiveSupport::Callbacks can generate bespoke callback chains for service objects. Define callback sets, halting conditions, and run them per instance for precise flow control.

```ruby
class EmailService
  include ActiveSupport::Callbacks
  define_callbacks :send

  set_callback :send, :before, :build_message
  set_callback :send, :after, :log_delivery

  def call
    run_callbacks :send do
      # actual send logic
    end
  end

  private
  def build_message; @message = MessageBuilder.build; end
  def log_delivery; Logger.info("Email sent"); end
end

EmailService.new.call
```

This pattern avoids coupling and mirrors AR’s callback flexibility.