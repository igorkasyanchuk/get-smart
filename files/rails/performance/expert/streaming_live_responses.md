## 🌊 High-Throughput Streaming with ActionController::Live

Stream large result sets or event data without buffering the full payload in memory by using `ActionController::Live`. Combine this with `Rack::Deflater` to gzip chunks on the fly.

```ruby
class ReportsController < ApplicationController
  include ActionController::Live

  def download_csv
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Encoding'] = 'gzip'

    gzip = Zlib::GzipWriter.new(response.stream)
    csv  = CSV.new(gzip)

    csv << %w[id name created_at]
    User.find_each(batch_size: 10_000) do |user|
      csv << [user.id, user.name, user.created_at]
    end
  ensure
    gzip.close
    response.stream.close
  end
end
```

This approach keeps your memory footprint bounded even when exporting millions of rows.