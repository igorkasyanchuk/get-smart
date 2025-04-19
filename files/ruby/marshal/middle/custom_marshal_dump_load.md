## 🛠️ Customize Marshaling with `marshal_dump` and `marshal_load`
Implementing `marshal_dump` and `marshal_load` on your class lets you control exactly what gets serialized and how it’s reconstructed. This is ideal for excluding transient data or transforming attributes during serialization. Define `marshal_dump` to return a serializable representation and `marshal_load` to restore state from that data.

```ruby
class Session
  attr_accessor :user_id, :token, :temp_cache

  def initialize(user_id, token)
    @user_id = user_id
    @token = token
    @temp_cache = {}  # runtime-only data
  end

  # Only persist user_id and token
  def marshal_dump
    { user_id: @user_id, token: @token }
  end

  def marshal_load(data)
    @user_id = data[:user_id]
    @token = data[:token]
    @temp_cache = {}  # reinitialize runtime data
  end
end

session = Session.new(42, "abc123")
serialized = Marshal.dump(session)
restored = Marshal.load(serialized)
puts restored.temp_cache  # => {}