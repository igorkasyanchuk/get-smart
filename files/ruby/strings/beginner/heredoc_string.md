## 📝 Multiline Strings with Heredoc

Heredocs let you define a multiline string neatly without `\n` escapes. You can choose quoting (`<<-` or `<<~`) to control indentation and interpolation.

```ruby
document = <<-DOC
Dear User,
  Welcome to our service!
Regards,
Team
DOC

puts document
```