## 🚀 Metaprogramming with method_missing in Helpers
By overriding `method_missing` and `respond_to_missing?` you can dynamically generate helpers on‑the‑fly for patterns like `icon_for_user` or `badge_for_status`. This avoids repetitive definitions and keeps your helper module DRY while still providing strongly named methods.

```ruby
# app/helpers/application_helper.rb
module ApplicationHelper
  def method_missing(name, *args, &block)
    if name.to_s.start_with?("icon_for_")
      resource = name.to_s.delete_prefix("icon_for_")
      content_tag(:i, "", class: "icon-#{resource}")
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?("icon_for_") || super
  end
end
```

Use `<%= icon_for_user %>` or `<%= icon_for_admin %>` without any explicit method definitions.