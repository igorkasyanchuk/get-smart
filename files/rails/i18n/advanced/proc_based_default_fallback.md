## 🔀 Proc-based Default Fallback
Use a Proc as the `:default` option in `I18n.t` to lazily generate fallback values only when needed. This allows dynamic defaults based on runtime data, reducing unnecessary lookups and improving performance.

```yaml
# config/locales/en.yml
en:
  greetings:
    hello: "Hello, %{name}"
```

```ruby
# Usage in Ruby code
I18n.t("greetings.goodbye", default: -> { I18n.t("greetings.hello", name: user.name) })
```
