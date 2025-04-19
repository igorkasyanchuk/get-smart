## ❓ Convert Strings to Query Objects with String#inquiry

`String#inquiry` turns a string into an `ActiveSupport::StringInquirer`, allowing elegant predicate methods. This is useful when comparing status or type values.

```ruby
status = "active".inquiry
status.active?     # => true
status.inactive?   # => false

# In a controller:
if params[:mode].inquiry.production?
  # production logic
end
```
