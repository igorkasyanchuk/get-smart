## 🚀 Custom Marshal Serialization with Versioning and Compression

You can define `_dump` and `_load` methods on your classes to manage serialization versioning and apply compression to reduce payload size. This approach ensures backward compatibility when your class structure changes and keeps the serialized data compact.

```ruby
require 'json'
require 'zlib'

class MyClass
  attr_accessor :name, :data
  VERSION = 1

  def initialize(name, data)
    @name = name
    @data = data
  end

  # Called by Marshal.dump
  def _dump(level)
    payload = { version: VERSION, name: @name, data: @data }.to_json
    Zlib::Deflate.deflate(payload)
  end

  # Called by Marshal.load
  def self._load(compressed)
    json = Zlib::Inflate.inflate(compressed)
    h = JSON.parse(json, symbolize_names: true)
    case h[:version]
    when 1
      new(h[:name], h[:data])
    else
      raise "Unsupported version: #{h[:version]}"
    end
  end
end

# Usage:
obj = MyClass.new('example', [1, 2, 3])
serialized = Marshal.dump(obj)
restored = Marshal.load(serialized)
```