## 🔒 Use Secure Compare for Tokens
Avoid timing attacks when comparing sensitive strings by using `ActiveSupport::SecurityUtils.secure_compare` instead of `==`.

```ruby
token_from_request = params[:token]
if ActiveSupport::SecurityUtils.secure_compare(token_from_request, stored_token)
  # tokens match
else
  # tokens do not match
end
```