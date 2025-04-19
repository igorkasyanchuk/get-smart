## 🧹 Always use ensure for cleanup
Use the `ensure` block to run cleanup code whether an exception occurs or not, such as closing files or releasing resources. This prevents resource leaks and keeps your application robust.

```ruby
begin
  file = File.open('data.txt', 'w')
  # ... write data ...
ensure
  file.close if file
end
```