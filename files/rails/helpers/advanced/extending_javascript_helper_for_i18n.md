## 🛠️ Extending JavaScript Helpers for I18n

Leverage `ActionView::Helpers::JavaScriptHelper` to safely embed translated messages or dynamic data in JavaScript. Use `j` (alias for `escape_javascript`) to prevent injection attacks.

```ruby
# app/helpers/application_helper.rb
module ApplicationHelper
  include ActionView::Helpers::JavaScriptHelper

  def i18n_js_variable(keys)
    messages = keys.map { |k| [k, I18n.t(k)] }.to_h
    javascript_tag("window.I18nMessages = #{j(messages.to_json)};")
  end
end
```
