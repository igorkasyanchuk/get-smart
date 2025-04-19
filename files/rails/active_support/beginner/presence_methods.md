## ✅ Check for Presence with present? and blank?

Instead of testing `nil` or empty strings/arrays manually, use `present?` to assert the presence of a value and `blank?` to catch `nil`, empty, or whitespace-only strings. This simplifies guard clauses.

```ruby
"".blank?         # => true
"   ".blank?      # => true
[1,2].present?     # => true
nil.present?       # => false
```
