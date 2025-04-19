## 🌐 Customizing Error Messages with I18n

Leverage Rails’ I18n backend to override default validation messages and interpolate model attributes. This ensures consistency and supports localization.

```yaml
# config/locales/models/user.en.yml
en:
  activerecord:
    errors:
      models:
        user:
          attributes:
            password:
              too_short: "must have at least %{count} characters"

# app/models/user.rb
class User < ApplicationRecord
  validates :password, length: { minimum: 8, too_short: :too_short }
end
```