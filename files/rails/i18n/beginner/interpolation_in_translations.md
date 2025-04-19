## 🔢 Use Interpolation for Dynamic Content

I18n interpolation lets you insert dynamic values into translations. Define placeholders in your YAML and pass a hash to `t` when rendering.

```yaml
# config/locales/en/greetings.en.yml
en:
  greetings:
    hello_user: "Hello, %{name}! Welcome back."
``` 
```erb
<!-- app/views/welcome/index.html.erb -->
<p><%= t('greetings.hello_user', name: current_user.name) %></p>
```