## 🧹 Sanitizing ActionText with Custom AllowLists

Customize `ActionText::ContentHelper` sanitization rules to allow only specific tags and attributes, reducing XSS risk.

```ruby
# config/initializers/action_text.rb
Rails::Html::SafeListSanitizer.allowed_tags += ['iframe']
Rails::Html::SafeListSanitizer.allowed_attributes += ['allowfullscreen']
```