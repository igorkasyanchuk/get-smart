## 🛠️ Custom Serialization with Version Control

Defining your own `_dump` and `_load` methods lets you control precisely what gets serialized, which is essential for maintaining backward compatibility across object structure changes. By embedding a version number in the serialized data, you can evolve your class without breaking old dumps.

```ruby
class MyClass
  attr_accessor :a, :b

  # Prefix serialized data with a version identifier
  def _dump(level)
    [1, @a, @b].join('::')
  end

  # _load is called with the dumped string
  def self._load(str)
    version, a, b = str.split('::')
    case version.to_i
    when 1
      new(a, b)
    # future versions can be handled here
    else
      raise ArgumentError, "Unknown version #{version}"
    end
  end
end

# Example usage
o = MyClass.new
o.a = 'foo'; o.b = 'bar'
dumped = Marshal.dump(o)
restored = Marshal.load(dumped)
```