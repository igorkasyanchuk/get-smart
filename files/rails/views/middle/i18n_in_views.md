## 🌐 Internationalization in ERB Templates
Keep your application ready for multiple locales by using the `t` helper in views. Pass interpolations and default fallbacks to make translations flexible.

```erb
<h1><%= t("welcome.title", user: current_user.name, default: "Welcome, %{user}!") %></h1>
```