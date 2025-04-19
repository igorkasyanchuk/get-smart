## 🧮 Perform Bitwise Manipulations for Flags & Masks
Ruby’s integer class supports bitwise operators (`&, |, ^, <<, >>`). Use them to define flags, create masks, or even reverse bits in a fixed width.

```ruby
READ    = 0b100
WRITE   = 0b010
EXECUTE = 0b001

# Combine flags
permissions = READ | EXECUTE
puts (permissions & WRITE).zero? ? "No write" : "Writable"
# => "No write"
```

Reverse bits in a given width:

```ruby
class Integer
  def reverse_bits(width)
    to_s(2).rjust(width, '0').reverse.to_i(2)
  end
end

puts 0b1100.reverse_bits(4).to_s(2)
# => "0011"
```