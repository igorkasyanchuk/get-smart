## 🛂 Runtime Extension via Fiddle

Dynamically link against C libraries at runtime with `Fiddle` to extend Ruby’s capabilities without writing a C extension. This is ideal for quick prototypes or one-off performance-critical calls.

```ruby
require 'fiddle'
require 'fiddle/import'

module LibC
  extend Fiddle::Importer
  dlload Fiddle.dlopen(nil)
  extern 'int puts(char*)'
end

LibC.puts('Hello from libc via Fiddle!')
```