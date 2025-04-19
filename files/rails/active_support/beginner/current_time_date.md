## ⏰ Use Time.current and Date.current

ActiveSupport provides convenient `Time.current` and `Date.current` methods that respect your Rails application’s time zone configuration. Instead of using `Time.now` or `Date.today`, prefer these helpers to ensure consistency across your app.

```ruby
Time.current  # => 2023-08-15 10:23:45 -0400
Date.current  # => Wed, 15 Aug 2023
```
