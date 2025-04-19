## 🎬 Stream Responses for Large Data
Use `ActionController::Live` to stream large data sets or server-sent events (SSE) without loading everything into memory. Enable streaming in your controller and write chunks to the response. Remember to close the stream when done.

```ruby
class ReportsController < ApplicationController
  include ActionController::Live

  def download
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Disposition'] = 'attachment; filename=report.csv'

    csv = CSV.generate do |csv|
      csv << ['ID', 'Name', 'Email']
      User.find_each { |u| csv << [u.id, u.name, u.email] }
    end

    response.stream.write(csv)
  ensure
    response.stream.close
  end
end
```