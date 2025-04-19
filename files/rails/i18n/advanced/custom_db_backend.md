## 🏗️ Custom DB-backed Translation Backend
By chaining a custom ActiveRecord backend with the Simple backend, you can manage translations in the database while still falling back to YAML files. This setup supports runtime updates without restarting your application.

```ruby
# lib/i18n/backend/active_record.rb
module I18n
  module Backend
    class ActiveRecord
      include Base
      include Flatten

      def translations
        @translations ||= load_from_db
      end

      private
      def load_from_db
        Translation.all.each_with_object({}) do |rec, h|
          store_translations(rec.locale, { rec.key => rec.value }, h)
        end
      end
    end
  end
end
```

```ruby
# config/initializers/i18n.rb
I18n.backend = I18n::Backend::Chain.new(
  I18n::Backend::ActiveRecord.new,
  I18n::Backend::Simple.new
)
```
