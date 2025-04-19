## 🛠️ Complex Pluralization Rules for Arabic
Languages like Arabic require more than the default `:one`/`:other` categories. You can register a custom pluralization rule via a `Proc` to correctly map counts to the six Arabic forms.

```ruby
# config/initializers/arabic_pluralization.rb
I18n.backend.store_translations(:ar, {
  i18n: {
    plural: {
      keys:   [:zero, :one, :two, :few, :many, :other],
      rule:   lambda do |n|
        case n
        when 0             then :zero
        when 1             then :one
        when 2             then :two
        when 3..10         then :few
        when 11..99        then :many
        else                   :other
        end
      end
    }
  }
})
```

Define your translations in `ar.yml` under these new keys and Rails will route counts correctly:

```yaml
en:
  notifications:
    zero: "No notifications"
    one: "1 notification"
    two: "%{count} notifications"
    few: "%{count} notifications"
    many: "%{count} notifications"
    other: "%{count} notifications"
```