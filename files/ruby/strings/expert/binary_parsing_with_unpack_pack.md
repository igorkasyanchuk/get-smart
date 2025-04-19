## 🔬 Parse and build binary protocols with unpack/pack

Ruby’s `String#unpack` and `Array#pack` provide direct access to binary data layouts. Use template directives (`C`, `L<`, `n`, etc.) to decode headers or serialize messages without external gems. This is your go‑to for implementing compact network or file protocols.

```ruby
# Unpack a 32-bit big‑endian length and payload
data = [0x00_00_00_05, 0x61_62_63_64_65].pack('N C5')
length, *bytes = data.unpack('N C*')
payload = bytes.pack('C*')
puts length     # => 5
puts payload    # => "abcde"
```