## 💅 HTML-safe Interpolation in Translations
Use `%{...}` to interpolate HTML snippets in your translation and then mark the output safe or sanitize it to prevent XSS.

```yaml
# config/locales/en.yml
en:
  newsletter:
    greet_html: "Hello <strong>%{name}</strong>! Check the <a href='%{link}'>details</a>."
```

```erb
<%= sanitize t('newsletter.greet_html', name: @user.name, link: newsletter_url(@user)) %>
```
