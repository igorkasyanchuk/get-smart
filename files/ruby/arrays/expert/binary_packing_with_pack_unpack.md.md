## 📦 Binary Packing with pack/unpack
Encode and decode numerical arrays efficiently by packing elements into compact binary strings, reducing memory and accelerating bulk I/O. This approach is ideal for streaming data to C extensions or binary protocols.

```ruby
# Pack array of floats (network byte order)
floats = [3.14, 2.71, 1.41]
binary = floats.pack('G*')
# Unpack back to floats
decoded = binary.unpack('G*')
puts decoded.inspect
```

```ruby
# Pack large integer arrays
ints = (1..1000).to_a
packed_ints = ints.pack('L*')  # 32-bit unsigned
unpacked = packed_ints.unpack('L*')
```