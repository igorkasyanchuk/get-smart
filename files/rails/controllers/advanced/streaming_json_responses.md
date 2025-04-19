## 📡 Stream JSON Responses with `ActionController::Live`
For large datasets, stream responses to reduce memory usage. Enable `ActionController::Live` in your controller and write chunks directly to the response stream.

```ruby
class ReportsController < ApplicationController
  include ActionController::Live

  def export
    response.headers['Content-Type'] = 'application/json; charset=utf-8'
    self.response_body = stream_json
  end

  private

  def stream_json
    Enumerator.new do |yielder|
      yielder << '['
      User.find_each.with_index do |user, i|
        yielder << ',' unless i.zero?
        yielder << user.to_json
      end
      yielder << ']'
    end
  end
end
```