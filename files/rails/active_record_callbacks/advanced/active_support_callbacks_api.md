## 🛠 Tip: Leveraging ActiveSupport::Callbacks API Directly

For ultimate flexibility, include `ActiveSupport::Callbacks` to define and manage callbacks outside ActiveRecord—ideal for POROs or service objects.

```ruby
class EmailPreparation
  include ActiveSupport::Callbacks
  define_callbacks :prepare

  set_callback :prepare, :before, :sanitize_content
  set_callback :prepare, :after, :compress_images

  def call(data)
    @data = data
    run_callbacks :prepare do
      # final assembly
      send_email
    end
  end

  private

  def sanitize_content
    @data[:body].strip!
  end

  def compress_images
    ImageCompressor.compress(@data[:images])
  end

  def send_email
    EmailService.deliver(@data)
  end
end
```

This pattern gives you full callback semantics in any Ruby object.