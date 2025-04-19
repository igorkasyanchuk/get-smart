## 📦 Auto-Require Gems
Load frequently used libraries automatically on startup. This saves you from typing `require` each time you open IRB.

```ruby
# ~/.irbrc
auto_requires = %w[pry awesome_print dotenv]
auto_requires.each { |gem_name| require gem_name }
```