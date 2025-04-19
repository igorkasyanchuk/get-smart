## 🐛 Rescuing Specific Exceptions

Instead of rescuing all errors with a bare `rescue`, target only the exceptions you expect. This prevents swallowing unexpected errors and makes debugging easier.

```ruby
begin
  file = File.read("config.yml")
  data = YAML.safe_load(file)
rescue Errno::ENOENT => e
  puts "Config file not found: #{e.message}"
rescue Psych::SyntaxError => e
  puts "YAML syntax error: #{e.message}"
end
```

Here, we rescue only file-not-found and YAML syntax errors, allowing other exceptions to bubble up.