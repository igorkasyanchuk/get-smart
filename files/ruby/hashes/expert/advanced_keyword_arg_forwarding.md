## 🎁 Advanced Keyword Argument Forwarding

Ruby 3 unified positional and keyword arguments. Use the double‐splat operator (`**`) and `ruby2_keywords` to forward hashes seamlessly, preserving performance and avoiding deprecation warnings:

```ruby
def call_api(endpoint:, **params)
  # …
end

def wrapper(*args, **kwargs)
  # prepend authentication
  auth_token = { token: ENV['API_TOKEN'] }
  call_api(**auth_token.merge(kwargs))
end

# For Ruby 2.7 compatibility
ruby2_keywords def legacy_wrapper(*args)
  wrapper(*args)
end
```

This pattern ensures you can wrap, manipulate, or augment argument hashes without losing Ruby’s keyword semantics or incurring warnings.