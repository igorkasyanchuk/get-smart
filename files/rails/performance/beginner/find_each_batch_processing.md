## ⚙️ Process Records in Batches
Loading large datasets at once can exhaust memory. Use `find_each` to fetch records in batches, processing them incrementally without bloating your app’s memory footprint.

```ruby
# Process users in batches of 1000
User.find_each(batch_size: 1000) do |user|
  # perform expensive operation
  user.send_welcome_email
end
```