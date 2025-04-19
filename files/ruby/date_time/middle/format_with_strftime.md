## 🛠️ Flexible Date/Time Formatting with `strftime`

Ruby’s `strftime` gives you full control over how dates and times are rendered. Combine directives for locale‑aware strings or custom output for reports and logs.

```ruby
now = Time.now
puts now.strftime('%Y-%m-%d')          # => "2023-06-15"
puts now.strftime('%B %d, %Y')         # => "June 15, 2023"
puts now.strftime('%I:%M %p on %a')    # => "07:35 PM on Thu"

# Zero‑pad day and month
puts now.strftime('%Y/%m/%d')          # => "2023/06/15"
```