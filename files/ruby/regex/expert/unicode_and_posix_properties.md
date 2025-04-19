## 🌐 Master Unicode & POSIX Property Escapes

Use `\p{...}` and POSIX classes like `[:Alpha:]` to build robust patterns for international text. Combine script and block properties for granular control.

```ruby
# Match any Greek letter
greek = /\p{Greek}+/u
p "αβγ".match?(greek)  # => true

# Match any letter or number from any script
alnum = /[\p{L}\p{N}]+/u
p "英文123".scan(alnum)  # => ["英文123"]
```

POSIX shorthand:

```ruby
# Match ASCII word chars only
ascii_word = /[[:word:]]+/  # equals [A-Za-z0-9_]
```