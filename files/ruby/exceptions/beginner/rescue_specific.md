## 🎯 Rescue specific exception classes
Specify exception classes after `rescue` to handle only certain errors and let others bubble up. This makes your error handling more precise and maintains program stability.

```ruby
begin
  data = File.read('missing.txt')
rescue Errno::ENOENT
  puts 'File not found'
rescue => e
  puts "Other error: #{e.message}"
end
```