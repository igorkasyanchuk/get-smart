## 📦 Double Splat for Flexible Keyword Arguments

The double splat operator (`**`) captures or expands keyword arguments as a hash, enabling you to write methods that accept or forward arbitrary options. It’s invaluable for building flexible DSLs and APIs.

```ruby
def configure(**options)
  defaults = { timeout: 5, verbose: false }
  settings = defaults.merge(options)
  puts settings.inspect
end

user_options = { verbose: true, retry: 3 }
configure(**user_options)
# Output: {:timeout=>5, :verbose=>true, :retry=>3}
```