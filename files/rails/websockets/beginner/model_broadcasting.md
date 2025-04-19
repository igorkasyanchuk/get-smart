## 🏭 Broadcasting with Active Record Callbacks

Leverage built-in broadcasting methods in Rails 6+ to automatically stream new records. Use `after_create_commit` in your model for clean and declarative broadcasting.

```ruby
# app/models/message.rb
class Message < ApplicationRecord
  after_create_commit { broadcast_append_to "chat_channel" }
end
```
