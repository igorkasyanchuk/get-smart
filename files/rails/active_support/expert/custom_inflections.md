## ✏️ Define Custom Inflections Across Locales
When working with domain-specific terms, tweak Rails’ inflector to handle irregular plurals globally. Update `config/initializers/inflections.rb` and group locale-based rules to avoid inconsistent naming.

```ruby
# config/initializers/inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'radius', 'radii'
  inflect.uncountable %w( metadata )
end

I18n.available_locales.each do |locale|
  ActiveSupport::Inflector.inflections(locale) do |inflect|
    inflect.acronym 'API'
  end
end
```

This ensures `model_name.pluralize` and path helpers remain consistent even under Turkish or German locales.