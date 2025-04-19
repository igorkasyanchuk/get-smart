## 📂 Using File.open with a Block
Opening a file with a block ensures Ruby closes it automatically when the block finishes, even if an error is raised. This pattern prevents file descriptor leaks and keeps your code clean.

```ruby
File.open('logs/app.log', 'r') do |file|
  file.each_line do |line|
    puts line
  end
end
```