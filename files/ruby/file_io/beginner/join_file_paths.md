## ➰ Build Paths Portably with `File.join`

Use `File.join` to construct file paths in a cross-platform way. It handles directory separators for you.

```ruby
directory = 'logs'
filename  = 'app.log'
path = File.join(directory, filename)
puts "Writing to: #{path}"
```