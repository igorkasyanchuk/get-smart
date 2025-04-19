## 🔧 Dynamic Association Definitions via Metaprogramming
Generate associations at runtime using metaprogramming to handle similarly structured models dynamically. This reduces boilerplate when multiple models share identical association patterns but differ in names or classes.

```ruby
module HasHistory
  def has_versioned_records_for(*models)
    models.each do |model_name|
      has_many "#{model_name}_versions", -> { order(created_at: :desc) },
               class_name: "#{model_name.to_s.classify}Version"
    end
  end
end

ActiveRecord::Base.extend(HasHistory)

class Document < ApplicationRecord
  has_versioned_records_for :revision
end
```