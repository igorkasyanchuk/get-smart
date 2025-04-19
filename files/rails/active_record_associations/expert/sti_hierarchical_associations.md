## 🔍 STI Associations with Hierarchical Models

In Single Table Inheritance hierarchies, you can still define association overrides on subclasses to restrict relationships. This yields clear domain-driven models and prevents cross-type contamination.

```ruby
class Document < ApplicationRecord
  # type column for STI
  has_many :comments, as: :commentable
end

class Report < Document
  has_many :review_notes, -> { where(notes_type: 'review') },
           class_name: 'Comment', as: :commentable
end
```
