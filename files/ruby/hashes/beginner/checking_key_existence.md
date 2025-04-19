## ✅ Checking for Key Presence
Before accessing a hash, you might want to check if a key exists using `key?`, `has_key?`, or `include?`. This is more intention-revealing than checking for `nil`.

```ruby
options = { debug: false, verbose: true }

if options.key?(:debug)
  puts "Debug mode is set"
else
  puts "Debug flag missing"
end
```