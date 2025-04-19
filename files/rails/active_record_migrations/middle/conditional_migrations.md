## 🎯 Conditional Migrations by Environment

Sometimes you need to run migrations only in specific environments. Wrap logic around `Rails.env` to prevent unwanted schema changes in staging or production.

```ruby
class AddDebugFlagToWidgets < ActiveRecord::Migration[6.1]
  def change
    if Rails.env.development? || Rails.env.test?
      add_column :widgets, :debug, :boolean, default: false
    end
  end
end
```
