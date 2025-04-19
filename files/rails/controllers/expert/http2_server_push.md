## 🔥 HTTP/2 Server Push in Rails Controllers

On HTTP/2-capable servers (e.g., Puma with `-- early-hints`), you can initiate server push from your controller by tapping into the Rack `push` hook. This preloads assets on the client side, reducing round-trips. Fallback gracefully when the feature isn’t available.

```ruby
class AssetsController < ApplicationController
  def index
    if request.env['rack.h2'] && request.env['rack.h2'].respond_to?(:push)
      %w(application.css application.js).each do |asset|
        request.env['rack.h2'].push(
          "/assets/#{asset}",
          { 'accept' => 'text/css,text/javascript' }
        )
      end
    end

    render :index
  end
end
```