## 🔗 Set Up Associations for Related Models

FactoryBot can automatically build associated records using the `association` helper. This is useful when your model depends on another, like an `Article` belonging to a `User`. Define the association in the factory to get nested test data.

```ruby
# spec/factories/articles.rb
FactoryBot.define do
  factory :article do
    title   { "Test Article" }
    content { "This is a test article." }
    association :user  # builds a user using the :user factory
  end
end
```

Create an article with its user:

```ruby
article = create(:article)
puts article.user.email  # => "john.doe@example.com" or configured default
```
