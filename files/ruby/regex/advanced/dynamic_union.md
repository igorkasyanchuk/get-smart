## 🛠️ Build Dynamic Patterns with Regexp.union
Generate complex alternations from arrays safely by using `Regexp.union`. It handles escaping and joins patterns, preventing injection or manual errors.

```ruby
keywords = ['foo.bar', 'foo*', 'baz']
pattern = Regexp.union(keywords)
# => /(?:foo\.bar|foo\*|baz)/
text = 'Match foo* or baz'
text.scan(pattern) #=> ["foo*", "baz"]
```