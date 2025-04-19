## 🎲 Generating Random Numbers

Ruby’s `rand` method lets you generate random numbers. Call `rand` without arguments for a float between 0.0 and 1.0, with an integer for values from `0` up to (but not including) that integer, or with a range for inclusive bounds.

```ruby
puts rand         # => 0.0...1.0
puts rand(10)     # => an Integer from 0 to 9
puts rand(1..6)   # => simulating a dice roll, 1 through 6
```