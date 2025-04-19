## 🖼️ Set X-Frame-Options Header

Prevent clickjacking by setting `X-Frame-Options` to `DENY` or `SAMEORIGIN` in responses.

```ruby
# config/application.rb
config.action_dispatch.default_headers.merge!({ 'X-Frame-Options' => 'SAMEORIGIN' })
```
