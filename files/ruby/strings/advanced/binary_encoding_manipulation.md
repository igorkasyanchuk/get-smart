## 🛠️ Manipulate Binary Data with String#b

When working with binary protocols or file formats, force a string into `ASCII-8BIT` to avoid Ruby’s default UTF-8 transcoding. Use `String#b` to return a binary-encoded copy, and `String#force_encoding` for in-place changes.

```ruby
# copy to binary encoding
binary = "ABC".b
puts binary.encoding        #=> #<Encoding:ASCII-8BIT>

# in-place override (dangerous if mixed content)
str = "Hello"
str.force_encoding("ASCII-8BIT")
puts str.encoding           #=> #<Encoding:ASCII-8BIT>
```
