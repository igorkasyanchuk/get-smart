## 🚀 Autoload Constants with const_missing

Intercept missing constant references to implement on-the-fly loading or custom lookup logic. This can reduce startup time by lazily loading components.

```ruby
module Services
  def self.const_missing(name)
    file = File.join(__dir__, 'services', "#{name.to_s.downcase}.rb")
    if File.exist?(file)
      require file
      const_get(name)
    else
      super
    end
  end
end

# Accessing Services::Payment will trigger loading services/payment.rb
service = Services::Payment.new
```