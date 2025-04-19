## 🏷️ Customize Inflection Rules

ActiveSupport::Inflector allows you to adapt pluralization, singularization, and acronyms to domain-specific vocabulary. Declaring custom rules prevents awkward model or table names and keeps your URLs clean. Put these rules in an initializer to ensure they're loaded before eager loading.

```ruby
# config/initializers/inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
  inflect.acronym 'OAuth'
  inflect.irregular 'person', 'people'
  inflect.uncountable %w( equipment information rice )
end
```
