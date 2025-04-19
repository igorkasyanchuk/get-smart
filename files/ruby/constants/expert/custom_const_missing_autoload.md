## 📦 Custom `const_missing` for Lazy Autoload Fallback

Override `const_missing` in your namespace to catch unresolved constants and autoload files or generate classes on the fly. This technique reduces upfront `require` statements and supports convention-over-configuration by mapping constant names to file paths. Use `super` after your logic to preserve Ruby’s standard error handling when a constant truly doesn’t exist.

```ruby
module Services
  def self.const_missing(name)
    file = name.to_s
                .gsub(/([A-Z])/, '_\\1')
                .downcase
                .sub(/^_/, '')
    path = Rails.root.join('app', 'services', "#{file}.rb")
    if File.exist?(path)
      require_dependency path
      return const_get(name)
    end
    super
  end
end

# Now referencing Services::UserNotifier will trigger loading app/services/user_notifier.rb
```