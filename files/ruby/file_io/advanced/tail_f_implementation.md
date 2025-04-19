## 🔄 Implement tail -f with seek and readpartial

Reproduce the Unix `tail -f` functionality in Ruby by seeking to the file’s end and periodically reading new data with `readpartial`. This approach works cross-platform without external dependencies.

```ruby
File.open('app.log', 'r') do |f|
  f.seek(0, IO::SEEK_END)
  loop do
    begin
      print f.readpartial(4096)
    rescue EOFError
      sleep 0.5
      retry
    end
  end
end
```

You can extend this to yield lines via an `Enumerator` or integrate with event-driven frameworks.