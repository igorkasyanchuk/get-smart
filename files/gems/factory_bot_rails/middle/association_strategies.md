## ⚙️ Choose the Right Strategy for Associations

FactoryBot offers `build`, `create`, and `attributes_for` strategies. Use `build` when you don't need persistence, `create` for database tests, and `attributes_for` to quickly get a hash of attributes for controller or API specs.

```ruby
# spec/factories/articles.rb
FactoryBot.define do
  factory :article do
    title { "Sample Article" }
    content { "Lorem ipsum..." }
    association :user, strategy: :build
  end
end

# Usage in specs
article = build(:article)                     # not saved to DB, user is built but unsaved
article = create(:article)                    # saved to DB along with user
attrs   = attributes_for(:article)             # { title: "Sample Article", content: "...", user_id: nil }
```