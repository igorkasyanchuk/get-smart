## 📚 Arrays for Ordered Collections

Arrays hold ordered lists of elements and can contain objects of any type. You can create arrays, add elements, access by index, and iterate over them. Arrays are dynamic, so you can change their size at runtime.

```ruby
# Create an array
fruits = ['apple', 'banana', 'cherry']
# Add an element
fruits << 'date'
# Access first and last elements
first, last = fruits.first, fruits.last
# Iterate over each element
fruits.each do |fruit|
  puts fruit.capitalize
end
```