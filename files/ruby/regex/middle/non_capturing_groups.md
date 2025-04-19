## 🚫 Use Non-Capturing Groups When You Don’t Need Backreferences
Non-capturing groups `(?:…)` group subpatterns without storing the match, improving performance and avoiding numbered capture shifts. Use them for alternation or grouping without the overhead.

```ruby
# Without non-capturing, you get unwanted groups
pattern1 = /(foo|bar)-(baz)/
pattern1.match('foo-baz').captures # => ["foo", "baz"]

# With non-capturing
pattern2 = /(?:foo|bar)-(baz)/
pattern2.match('bar-baz').captures  # => ["baz"]
```

Reserve capturing groups for the data you actually need to reference later.