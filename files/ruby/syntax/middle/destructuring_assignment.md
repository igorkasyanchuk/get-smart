## 🧩 Destructuring Assignment

Ruby lets you unpack arrays or hashes directly into variables using parallel assignment. This reduces boilerplate when extracting multiple values.

```ruby
# Array destructuring:
first, second, *rest = [1, 2, 3, 4]
# first => 1, second => 2, rest => [3, 4]

# Hash destructuring:
person = { name: "Alice", age: 30, city: "NY" }
name, age = person.values_at(:name, :age)
# name => "Alice", age => 30
```