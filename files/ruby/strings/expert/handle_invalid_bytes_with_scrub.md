## 🧠 Handle invalid byte sequences with String#scrub

Corrupted or mis‑encoded data can raise `Encoding::InvalidByteSequenceError`. Use `String#scrub` to replace or transform invalid bytes in a single pass. You can supply a default replacement or a custom block to map each invalid byte sequence to a new string.

```ruby
s = "cafafé".force_encoding("UTF-8")
# Default replacement: U+FFFD
puts s.scrub                          # => "caf�@�@é"
# Custom handler:
puts s.scrub { |bytes| "[#{bytes.unpack1('H*')}]" }
# => "caf[f][0e][0c]é"
```