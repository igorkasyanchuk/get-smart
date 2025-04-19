## 📆 Date and Time Localization

Use the built‑in `l` (alias for `localize`) helper to format dates and times according to locale‑specific formats. Define custom formats under `time` or `date` scopes in your locale files.

```erb
<!-- app/views/events/show.html.erb -->
<p><%= l(@event.starts_at, format: :long) %></p>
```

```yaml
# config/locales/en.yml
en:
  time:
    formats:
      short: "%d %b %H:%M"
      long:  "%B %d, %Y at %H:%M"
```