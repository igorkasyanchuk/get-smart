## 🌳 Build Nested Hashes with Recursive Default Procs
Use a hash default proc that references itself to auto-vivify arbitrary nesting levels without manual checks.

```ruby
deep_hash = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }

deep_hash[:users][:alice][:roles] << :admin
# Now deep_hash auto-created nested hashes
puts deep_hash.inspect
# => { :users=>{ :alice=>{ :roles=>[:admin] } } }

# You can mix types too:
deep_hash[:settings][:theme] = "dark"
puts deep_hash
# => { :users=>{ :alice=>{ :roles=>[:admin] } }, :settings=>{ :theme=>"dark" } }
```