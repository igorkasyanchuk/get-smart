## 🔑 Indifferent Access with ActiveSupport

`HashWithIndifferentAccess` from Rails lets you access keys as strings or symbols interchangeably. It’s ideal when handling params or JSON data from external sources.

```ruby
require 'active_support/core_ext/hash/indifferent_access'

h = { 'user_id' => 42, token: 'xyz' }.with_indifferent_access

h[:user_id]   # => 42
h['token']    # => "xyz"
h.fetch('missing', nil) # => nil
```