## 🗂️ `HashWithIndifferentAccess` for Symbol/String Keys
Rails provides `with_indifferent_access` to allow both string and symbol key access on hashes. This is especially handy when merging params or configuration hashes from mixed sources.

```ruby
config = { "host" => "localhost", port: 3000 }.with_indifferent_access
config[:host]   # => "localhost"
config["port"] # => 3000
```
