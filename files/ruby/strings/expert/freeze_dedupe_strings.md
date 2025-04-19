## 🦾 Freeze and dedupe strings to reduce memory

Freezing strings (`String#freeze`) allows the interpreter to dedupe identical literals at compile time (`--enable=frozen-string-literal=all`) or at runtime via `String#-@`. Combined with `String#+@`, you can canonicalize user input on the fly, reducing GC pressure in long‑running processes.

```ruby
# Deduplicate a runtime string
raw = String.new("config_option")
canon = +raw.freeze   # +raw invokes String#-@ then freeze
# both references now share the same frozen object
puts raw.equal?(canon)  # => true
```