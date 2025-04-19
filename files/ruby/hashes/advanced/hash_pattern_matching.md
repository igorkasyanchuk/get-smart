## 🧩 Pattern Matching for Hash Destructuring

Ruby 2.7+ supports pattern matching, enabling concise destructuring of Hashes in `case` or `in`. This lets you extract only relevant keys and enforce presence.

```ruby
def handle_event(event)
  case event
  in { type: 'login', user: { id:, name: } }
    "User \\#{name} (ID \\#{id}) logged in"
  in { type: 'error', code:, message: }
    "Error \\#{code}: \\#{message}"
  else
    "Unhandled event"
  end
end

handle_event({ type: 'login', user: { id: 1, name: 'Alice' } })
# => "User Alice (ID 1) logged in"
```