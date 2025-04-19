## 💡 Destructuring Assignment for Easy Extraction
Destructuring assignment lets you unpack elements from an array into variables in a single line, making your code concise and readable. It’s especially useful when you know the exact positions of the elements you need. You can also use the splat operator (`*`) to capture remaining items.

```ruby
# Basic destructuring
first, second, third = ["apple", "banana", "cherry"]
# first => "apple", second => "banana", third => "cherry"

# Using splat to capture rest
head, *tail = [1, 2, 3, 4]
# head => 1, tail => [2, 3, 4]
```
