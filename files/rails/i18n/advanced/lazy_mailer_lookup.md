## 📧 Lazy Lookup in Mailer Views
Use the `.` shorthand to reference translation keys relative to the mailer class and view path. This reduces duplication and enforces namespace consistency in email templates.

```erb
<!-- app/views/user_mailer/welcome_email.html.erb -->
<h1><%= t ".subject", user: @user.name %></h1>
<p><%= t ".body" %></p>
```

```yaml
# config/locales/en.yml
en:
  user_mailer:
    welcome_email:
      subject: "Welcome, %{user}!"
      body: "Thanks for joining our platform."
```
