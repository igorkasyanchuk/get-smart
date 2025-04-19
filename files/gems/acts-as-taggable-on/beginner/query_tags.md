## 🔍 Query records by tags

Retrieve tagged records easily with built‑in methods. Use `tagged_with` to find items matching specific tags, and `tag_counts_on` to list all tags used on a given context.

```ruby
# Find all articles tagged with 'ruby'
@ruby_articles = Article.tagged_with('ruby')

# Find articles tagged with either 'ruby' or 'rails'
@any_tagged = Article.tagged_with(['ruby', 'rails'], any: true)

# Get a list of all tags on Article
@tag_list = Article.tag_counts_on(:tags)
```