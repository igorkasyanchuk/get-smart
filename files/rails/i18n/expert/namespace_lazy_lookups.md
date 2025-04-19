## 🔄 Namespace & Lazy Lookups Optimization
Lazy lookup (`t('.title')`) automatically prefixes keys with your view or controller path, eliminating repetition. Combine this with deeply nested YAML scopes to maintain context and drastically reduce key collisions.

```erb
<!-- app/views/projects/show.html.erb -->
<h1><%= t('.header') %></h1>
<p><%= t('.description') %></p>
```

```yaml
# config/locales/projects/show.en.yml
en:
  projects:
    show:
      header: "Project Details"
      description: "Here’s the full overview of your project."
```

If you rename or move the view, Rails infers the new scope automatically, and you never need to update your translation keys manually.