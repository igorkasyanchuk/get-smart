## 📑 Processing Files Line by Line with File.foreach
`File.foreach` yields each line directly and handles opening/closing for you. It’s ideal for memory-efficient line-based parsing.

```ruby
File.foreach('config/settings.yml') do |line|
  next if line.strip.empty?
  key, value = line.split(':', 2)
  process_setting(key.strip, value.strip)
end
```