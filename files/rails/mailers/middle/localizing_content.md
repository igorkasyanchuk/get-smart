## 🌐 Localize Mailer Content with I18n

Use Rails I18n to translate subjects, headers, and bodies of your emails. This ensures users receive messages in their preferred language without duplicating templates.

```yaml
# config/locales/en.yml
en:
  user_mailer:
    reset_password:
      subject: "Reset your password"
      greeting: "Hello %{name},"
```

```erb
<!-- app/views/user_mailer/reset_password.html.erb -->
<p><%= t('user_mailer.reset_password.greeting', name: @user.name) %></p>
<p><%= link_to t('user_mailer.reset_password.link_text'), reset_password_url(@user, token: @token) %></p>
```