## ⚡️ High-Performance JSON Serialization with Oj’s Object Hooks

Oj provides blazing-fast JSON I/O with the ability to register custom handlers for complex Ruby objects. Use `Oj.register_odd` or the `dump_opts` + `load_opts` hooks to control precisely how objects are emitted and rehydrated, avoiding reflection and minimizing payload size.

```ruby
require 'oj'

# Configure Oj for best performance in strict mode
Oj.default_options = { mode: :strict, use_to_json: false, use_as_json: false }

# Define serialization hook
Oj.register_odd(
  :UserProfile,
  { call: ->(obj) { { n: obj.name, e: obj.email, p: obj.preferences } } },
  { create: ->(hash) { UserProfile.new(hash[:n], hash[:e], hash[:p]) } }
)

# Now dumps are tiny and parse directly back into objects
user = UserProfile.new("Bob", "b@example.com", { lang: 'en' })
json = Oj.dump(user)
restored = Oj.load(json)
```