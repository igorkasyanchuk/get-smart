## 🔢 Pluralization with count

Rails I18n supports pluralization rules based on the `count` option. Define `one` and `other` keys in your locale file and pass the `count` to `t` for automatic singular/plural selection.

```erb
<!-- app/views/notifications/index.html.erb -->
<p><%= t('notifications.messages', count: @messages.size) %></p>
```

```yaml
# config/locales/en.yml
en:
  notifications:
    messages:
      one:   "You have %{count} new message"
      other: "You have %{count} new messages"
```