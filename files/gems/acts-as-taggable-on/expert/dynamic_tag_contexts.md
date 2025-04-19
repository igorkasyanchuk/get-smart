## 🚀 Dynamic Tag Contexts with Custom Scopes
You can define and manipulate tag contexts at runtime to build more flexible tagging systems. This approach lets you add or remove contexts dynamically based on business logic, without altering your model definitions.

```ruby
# Define a base taggable model without fixed contexts
class Article < ApplicationRecord
  acts_as_taggable_on :_dynamic

  # Dynamically add contexts
  def self.add_context(context_name)
    ActsAsTaggableOn.remove_unused_tags
    acts_as_taggable_on context_name
  end
end

# Usage
Article.add_context(:seo_keywords)
article = Article.create(title: "Dynamic Tags")
article.seo_keywords_list.add("rails", "performance")
article.save
```

You can also remove contexts on the fly:

```ruby
def self.remove_context(context_name)
  tag_types.delete(context_name.to_s)
end
```

This pattern is ideal for multi-tenant apps where each tenant may require custom tagging domains.