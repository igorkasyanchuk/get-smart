## 📝 Dedent with Squiggly Heredocs
The `<<~` (squiggly) heredoc automatically removes leading indentation, letting you embed multi-line strings in indented code without unwanted spaces. It’s perfect for formatted text, SQL queries, or HTML snippets. Just ensure the terminator shares the code’s indentation level.

```ruby
def email_body(name)
  <<~BODY
    Hi #{name},
    Thanks for signing up! Here’s how to get started:
      1. Log in
      2. Update your profile
    Cheers,
    The Team
  BODY
end

puts email_body("Bob")
```