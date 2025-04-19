## ⚡️ Layout Fragment Caching with Russian Doll Strategy
Boost performance by caching expensive layout fragments and nesting caches. When using Russian doll caching, you can expire only the necessary parts without flushing the entire layout.

In `app/views/layouts/application.html.erb`:

```erb
<% cache ['layout', current_user.cache_key_with_version, I18n.locale] do %>
  <header>
    <%= render 'shared/global_nav' %>
  </header>

  <main>
    <%= yield %>
  </main>

  <footer>
    <%= render 'shared/footer' %>
  </footer>
<% end %>
```

Inside partials, keep caching nested:

```erb
<!-- app/views/shared/_global_nav.html.erb -->
<% cache ['nav', current_user.cache_key_with_version] do %>
  <nav><!-- expensive menu build --></nav>
<% end %>
```