## 🧹 Using `ensure` for Resource Cleanup

The `ensure` block always runs, whether an exception occurs or not. Use it to release resources like file handles, database connections, or locks.

```ruby
file = File.open("data.txt", "w")
begin
  file.write("Important data")
  # ... more processing
rescue IOError => e
  puts "Write failed: #{e.message}"
ensure
  file.close
end
```

Even if an `IOError` is raised, `ensure` guarantees that the file is closed, preventing resource leaks.