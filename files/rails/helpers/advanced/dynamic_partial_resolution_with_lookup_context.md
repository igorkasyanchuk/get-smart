## 🔍 Dynamic Partial Resolution with lookup_context

Use `lookup_context` to verify existence or locate templates in custom paths before rendering. This technique supports feature toggles or theming by selecting partials at runtime.

```ruby
# app/helpers/theme_helper.rb
module ThemeHelper
  def themed_partial(base, theme)
    path = "#{base}/#{theme}"
    if lookup_context.find_all("#{path}").any?
      render partial: path
    else
      render partial: "#{base}/default"
    end
  end
end
```
