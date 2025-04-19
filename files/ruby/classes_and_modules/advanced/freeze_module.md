## 🛡️ Locking Down Modules by Freezing

After defining methods and constants, call `freeze` on modules to prevent accidental reopenings or modifications at runtime.

```ruby
module SecureConfig
  API_ENDPOINT = "https://api.example.com".freeze
  TIMEOUT = 10

  def self.timeout
    TIMEOUT
  end
end

SecureConfig.freeze

# Any further `module SecureConfig; def foo; end; end` will raise a RuntimeError.
```

Freezing modules helps ensure API stability in large systems or gems.