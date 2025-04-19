## ⚡ Streaming Partials with ActionController::Live
Leverage ActionController::Live to stream large partials chunk by chunk, reducing memory footprint and time to first byte. This is vital when rendering thousands of records or large data transforms.

```ruby
# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/html; charset=utf-8'
    self.response_body = stream_renderer
  end

  private

  def stream_renderer
    Enumerator.new do |yielder|
      yielder << render_to_string(partial: 'reports/header')
      Report.find_each(batch_size: 1000) do |report|
        yielder << render_to_string(partial: 'reports/item', locals: { report: report })
      end
      yielder << render_to_string(partial: 'reports/footer')
    end
  end
end
```