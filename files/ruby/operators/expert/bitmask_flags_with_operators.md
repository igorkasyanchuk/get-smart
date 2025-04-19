## 🔧 Bitmask-Based Flags via Bitwise Operators

Implement extensible flag enums using bitwise operators (`|`, `&`, `^`, `~`). This allows clear, performant flag manipulation in domain code.

```ruby
class Flags
  FLAGS = { read: 0b001, write: 0b010, execute: 0b100 }

  def initialize(mask = 0)
    @mask = mask
  end

  FLAGS.each do |name, bit|
    define_method(name) { (@mask & bit) != 0 }
    define_method("#{name}=") do |val|
      @mask = val ? (@mask | bit) : (@mask & ~bit)
    end
  end

  def |(other)
    self.class.new(@mask | other.to_i)
  end

  def &(other)
    self.class.new(@mask & other.to_i)
  end

  def ^(other)
    self.class.new(@mask ^ other.to_i)
  end

  def to_i; @mask; end
end

f1 = Flags.new
f1.read = true
f2 = Flags.new
f2.write = true
combined = f1 | f2
puts combined.to_i    # ⇒ 3 (0b011)
```