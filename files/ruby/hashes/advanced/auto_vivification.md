## 🌱 Auto‐Vivification for Nested Hashes

Ruby Hashes don’t auto-vivify nested keys by default. Use `Hash.new` with a default proc to create missing sub‐hashes on assignment. This simplifies building deep structures without manual checks.

```ruby
nested = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }

nested[:user][:profile][:settings][:theme] = 'dark'
# => { :user => { :profile => { :settings => { :theme => "dark" } } } }

# You can assign arbitrarily deep without initializing intermediate levels.
```