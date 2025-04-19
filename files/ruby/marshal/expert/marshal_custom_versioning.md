## 🔧 Versioned Custom Marshaling

When evolving serialized formats, embed a version and implement `_dump`/`_load` to handle multiple layouts. This allows backward compatibility and graceful migration.

```ruby
class Widget
  CURRENT_VERSION = 2

  def initialize(name, options = {})
    @name    = name
    @options = options
  end

  # Called by Marshal.dump
  def _dump(level)
    payload = { name: @name, opts: @options }
    [CURRENT_VERSION, Marshal.dump(payload)].join(":")
  end

  # Called by Marshal.load
  def self._load(str)
    ver, data = str.split(":", 2)
    obj     = allocate
    hash    = Marshal.load(data)

    case ver.to_i
    when 1
      # In v1, options were a flat hash
      obj.instance_variable_set(:@name, hash[:name])
      obj.instance_variable_set(:@options, hash[:opts] || {})
    when 2
      # v2 tweaks option format
      obj.instance_variable_set(:@name, hash[:name].upcase)
      obj.instance_variable_set(:@options, hash[:opts])
    else
      raise "Unsupported version: \\#{ver}"
    end

    obj
  end
end

# Usage:
w = Widget.new("test", enabled: true)
bin = Marshal.dump(w)
w2 = Marshal.load(bin)
```
