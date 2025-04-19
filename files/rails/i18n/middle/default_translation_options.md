## 💡 Default Translation Options

I18n `t` supports a `default` option to fall back to other keys or static text when a translation is missing. Pass a string or array of keys for ordered fallbacks.

```erb
<!-- app/views/dashboard/index.html.erb -->
<h2><%= t('admin.dashboard.title', default: t('dashboard.title', default: 'Welcome')) %></h2>
```

```erb
<!-- or using arrays of keys -->
<h2><%= t('admin.settings.header', default: ['settings.header', 'Settings']) %></h2>
```