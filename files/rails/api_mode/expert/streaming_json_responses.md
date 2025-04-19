## 🚀 Streaming JSON with ActionController::Live
Use `ActionController::Live` for chunked JSON or Server-Sent Events in API mode without blocking the main thread. This is ideal for large datasets or real-time feeds, but be sure to manage thread pools (Puma) and close streams to avoid leaks.

```ruby
class UsersController < ActionController::API
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'application/json; charset=utf-8'
    response.stream.write '['

    User.find_each.with_index do |user, i|
      response.stream.write(',') if i.positive?
      response.stream.write(user.to_json)
    end

    response.stream.write ']'        
  ensure
    response.stream.close
  end
end
```