## 🔖 Symbols as Lightweight Identifiers

Symbols are immutable, reusable constants preceded by a colon. They are often used as keys in hashes or to reference method names. Because they are reused, symbols are more memory-efficient than strings for identifiers.

```ruby
# Define a symbol
status = :active
# Compare symbols
event_state = :active
puts 'Event is active' if status == event_state

# Use symbols as hash keys
settings = { theme: 'dark', notifications: true }
puts settings[:theme]   # => "dark"
```