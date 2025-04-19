## ⚙️ Advanced Route Globbing and Parameter Extraction

Globbing (`*`) routes are powerful for catch-all patterns like nested file paths, deep API resources, or sitemap generation. Combine globbing with a custom constraint to validate or transform the captured segments before the controller sees them.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  get 'files/*filepath', to: 'files#show', constraints: lambda { |req|
    # only allow .md or .txt files
    req.params[:filepath].match?(/\.(md|txt)$/)
  }
end

# app/controllers/files_controller.rb
class FilesController < ApplicationController
  def show
    safe_path = params[:filepath]
    full_path = Rails.root.join('public', 'uploads', safe_path)
    send_file full_path, disposition: 'inline'
  end
end
```