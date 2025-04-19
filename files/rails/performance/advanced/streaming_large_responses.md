## 🚀 Streaming Large Responses with ActionController::Live

For very large payloads (CSV, JSON, logs), streaming avoids loading the entire result set into memory. Include `ActionController::Live` in your controller and write to the response in chunks, closing the stream when done.

```ruby
class ExportsController < ApplicationController
  include ActionController::Live

  def download_csv
    response.headers["Content-Type"] = "text/csv"
    response.headers["Content-Disposition"] = "attachment; filename=export.csv"

    csv = CSV.new(response.stream)
    User.find_each(batch_size: 1000) do |user|
      csv << [user.id, user.email, user.created_at]
    end
  ensure
    response.stream.close
  end
end
```