## ⏩ Skipping Records with `offset`

`offset` skips a specified number of records before returning results. It’s commonly used alongside `limit` for pagination. Ensure consistent ordering to avoid duplicate or missing records between pages.

```ruby
# Skip first 10 and fetch next 5 users
users_page_2 = User.order(:id).offset(10).limit(5)
```