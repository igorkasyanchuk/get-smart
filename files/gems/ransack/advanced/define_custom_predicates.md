## ⚙️ Define Custom Predicates and Scopes
Sometimes built-in predicates (`cont`, `eq`, etc.) aren’t enough. You can register custom predicates globally or use `ransackable_scopes` for complex logic.

```ruby
# config/initializers/ransack.rb
Ransack.configure do |config|
  # Custom predicate for fuzzy matching using trigram similarity
  config.add_predicate 'similar_to',
    arel_predicate: 'matches',
    formatter: proc { |v| "%#{v}%" },
    validator: proc { |v| v.present? },
    compounds: false,
    type: :string
end

# app/models/article.rb
class Article < ApplicationRecord
  # Allow ransack to call a custom scope
  scope :published_last_week, -> {
    where(published_at: 1.week.ago.beginning_of_day..Time.current)
  }

  def self.ransackable_scopes(auth_object = nil)
    %i[published_last_week]
  end
end
``` 

Usage in controller:

```ruby
@q = Article.ransack(
  title_similar_to: 'Rails',
  published_last_week: true
)
@articles = @q.result
```

This registers `similar_to` as a new predicate and lets you call the `published_last_week` scope directly in your search form.