## 🪓 Use Regex for Flexible Splitting
`String#split` accepts a regex, enabling you to split on complex delimiters, capture parts of the delimiter, or omit empty fields.

```ruby
# Split on commas or semicolons
data = 'a,b;c,,d' .split(/[,;]+/)   # => ["a","b","c","d"]

# Keep delimiters in the result
tokens = '1+2-3'.split(/([+-])/)
# => ["1", "+", "2", "-", "3"]
```

Regex-powered splits handle varied and repeated delimiters effortlessly.