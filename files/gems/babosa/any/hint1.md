### 💎 Ruby Gem Tip: Generate Clean URLs Easily with `babosa`

The `babosa` gem simplifies creating SEO-friendly slugs from strings, even with non-ASCII characters.

**Example:**

```ruby
require 'babosa'

title = "Ruby on Rails: Einführung und Beispiele"
slug = title.to_slug.normalize.to_s

puts slug
# Output: ruby-on-rails-einfuhrung-und-beispiele
```
