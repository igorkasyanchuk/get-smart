## 🛑 Customize form error highlighting
By default, Rails wraps fields with errors in a div. You can override this behavior by redefining `ActionView::Base.field_error_proc` in an initializer to match your CSS framework.

```ruby
# config/initializers/field_error_proc.rb
ActionView::Base.field_error_proc = Proc.new do |html_tag, _instance|
  "<div class=\"field_with_errors custom-error\">#{html_tag}</div>".html_safe
end
```
