## 🧙‍♂️ Defining Dynamic Actions with Metaprogramming

Reduce duplication by programmatically generating similar actions using `define_method`. Combine with routing constraints or custom respond logic to handle multiple resource types in one controller.

```ruby
class AdminController < ApplicationController
  %w(users posts comments).each do |resource|
    define_method("export_#{resource}") do
      items = resource.classify.constantize.all
      csv   = items.to_csv
      send_data csv, filename: "#{resource}-#{Date.today}.csv"
    end
  end
end

# config/routes.rb
Rails.application.routes.draw do
  namespace :admin do
    get 'export_users', to: 'admin#export_users'
    get 'export_posts', to: 'admin#export_posts'
    get 'export_comments', to: 'admin#export_comments'
  end
end
```