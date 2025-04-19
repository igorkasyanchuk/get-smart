## ✅ Validate Input with Anchors
Anchors `^` and `$` ensure your pattern matches the entire string (or line in multiline mode). This prevents partial matches when validating formats.

```ruby
# Validate a 5-digit zip code
zip_pattern = /^\d{5}$/
zip_pattern.match?('12345')  # => true
zip_pattern.match?('12345-6789') # => false

# Multiline: each line must be an email
emails = "a@x.com\nb@y.org"
puts emails.scan(/^\S+@\S+\.[a-z]+$/) # => ["a@x.com","b@y.org"]
```

Use anchors to lock down your validations and avoid unexpected partial matches.