## ⚙️ High-Performance Bitwise and Binary Data Manipulation

Ruby’s `Integer` bitwise operators plus `String#pack`/`String#unpack` let you efficiently parse or compose binary protocols and file formats. Use bitmasks and shifts to extract flags or fields, and stream data with `StringIO` for large payloads.

```ruby
require 'stringio'

# Compose a 2-byte header: 0xA5 in first byte, flags in second
version = 0xA5
flags   = (1 << 3) | (0 << 1) | 1  # e.g., bits 3 and 0 set
header  = [version, flags].pack('C2')

# Parse back
byte1, byte2 = header.unpack('C2')
is_flag3_set = (byte2 & 0b1000) != 0

# Stream large binary blob
io = StringIO.new
io.write(header)
io.write(binary_payload)
io.rewind
while chunk = io.read(1024)
  process(chunk)
end
```