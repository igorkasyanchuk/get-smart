## 🧹 Cleaning up Arrays with uniq and compact
To remove duplicates use `uniq`, and to drop `nil` values use `compact`. Chain them to clean data in one go.

```ruby
data = [1, nil, 2, 2, nil, 3]

clean = data.uniq.compact  # => [1, 2, 3]
```