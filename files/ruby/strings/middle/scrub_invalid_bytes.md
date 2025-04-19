## 🧹 Cleanse Invalid Bytes with scrub
When reading user input or external data, invalid byte sequences can cause exceptions in string operations. `String#scrub` replaces or removes invalid bytes according to your specified replacement, ensuring your string remains valid UTF-8 without manual rescanning.

```ruby
raw = "Hello \xFF World".dup.force_encoding("UTF-8")
clean = raw.scrub("�")
puts clean  # => "Hello � World"
# Remove invalid bytes entirely
puts raw.scrub("")  # => "Hello  World"
```