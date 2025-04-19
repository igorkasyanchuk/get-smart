## 🛡️ Per-Request CSP Nonces
To safely allow inline `<script>` or `<style>` tags without relaxing your entire CSP, generate a unique nonce per response. Attach it to both the policy and the tags in your layout, ensuring only your dynamic inline code runs.

```ruby
# config/initializers/content_security_policy.rb
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.script_src  :self, -> { "'nonce-#{secure_random_nonce}'" }
  policy.style_src   :self, -> { "'nonce-#{secure_random_nonce}'" }
end

# app/helpers/application_helper.rb
module ApplicationHelper
  def secure_random_nonce
    @secure_random_nonce ||= SecureRandom.base64(16)
  end
end
```

```erb
<!-- app/views/layouts/application.html.erb -->
<head>
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>
  <script nonce="<%= secure_random_nonce %>">console.log('Safe inline!');</script>
</head>
```
