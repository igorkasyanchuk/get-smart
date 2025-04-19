## 🎒 Destructure Keyword Args with Splat
In Ruby 2.7+, you can capture and destructure unknown keyword arguments using `**rest`, and even apply pattern matching to them. This simplifies complex interfaces that evolve over time.

```ruby
def process_data(id:, **rest)
  case rest
  in { user_name:, created_at: }
    puts "ID=#{id}, User=#{user_name}, Created=#{created_at}"
  else
    puts "Unknown shape: #{rest.inspect}"
  end
end

process_data(id: 1, user_name: "Bob", created_at: Time.now)
```