## ✨ Converting Methods to Procs with Symbol#to_proc

Ruby's `Symbol#to_proc` shorthand (`&:method_name`) makes mapping and selection more concise. It converts a symbol into a proc that calls the named method on each element. This simplifies common enumerations.

```ruby
names = ["alice", "bob", "carol"]
# Using map with a block
upcased = names.map { |name| name.upcase }
# Using Symbol#to_proc shorthand
upcased = names.map(&:upcase)

# Selecting objects by a boolean method
evens = [1,2,3,4,5].select(&:even?)  #=> [2,4]
```