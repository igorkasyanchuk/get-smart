## 🕰 Contextual Validations with Custom Contexts

Rails supports built‑in `:create` and `:update` contexts. You can also define your own contexts and invoke them via `valid?(:context_name)` to run a distinct set of validations.

```ruby
class Article < ApplicationRecord
  validates :title, presence: true, on: :publish
  validates :body, length: { minimum: 100 }, on: :publish

  def publish!
    if valid?(:publish)
      update!(published_at: Time.current)
    else
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end

# Usage
article = Article.new(title: "Hi", body: "Too short")
article.valid?(:publish) # false
```