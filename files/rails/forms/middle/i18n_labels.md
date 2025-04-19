## 🌐 Leverage I18n for labels and placeholders
Use Rails’ I18n support to translate form labels and placeholders. Define your translations in locale files and call `t` within form helpers for consistency across languages.

```yaml
# config/locales/en.yml
en:
  activerecord:
    attributes:
      user:
        email: 'Email Address'
```

```erb
<%= form_with(model: @user) do |form| %>
  <%= form.label :email, t('activerecord.attributes.user.email') %>
  <%= form.email_field :email, placeholder: t('activerecord.attributes.user.email') %>
  <%= form.submit %>
<% end %>
```
