## 🎲 Batched Processing with `find_each`

`find_each` retrieves records in batches, reducing memory footprint when processing large datasets. It defaults to batches of 1000 but can be customized.

```ruby
# Send an email to each active user in batches of 500
User.where(active: true).find_each(batch_size: 500) do |user|
  UserMailer.welcome_email(user).deliver_later
end
```