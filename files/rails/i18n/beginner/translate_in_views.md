## 🔤 Translate Text in Views

Use the `t` (or `translate`) helper in views to fetch translated strings. By default, Rails will look under the current controller scope if you use dotted keys.

```erb
<!-- app/views/users/index.html.erb -->
<h1><%= t('users.title') %></h1>

<!-- Scoped translation: looks for users.profile.name -->
<label><%= t('.profile.name') %></label>
```