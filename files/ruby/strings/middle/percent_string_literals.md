## 🆚 Choose %q/%Q for Flexible Quoting
Using `%q` (`single-quoted`) and `%Q` (`double-quoted`) string literals lets you avoid backslashes when your string contains lots of quotes. You can pick any delimiter pair (`()`, `[]`, `{}`, `<>`, or custom). `%Q` supports interpolation and escape sequences, while `%q` treats its content literally.

```ruby
path = %q(/home/user/projects)
puts path               # => "/home/user/projects"
message = %Q|He said, "It\'s OK"|
puts message            # => "He said, \"It's OK\""
interpolated = %Q{Now: #{Time.now.hour}:00}
puts interpolated
```