## 🎨 Enhanced Output with AwesomePrint

By default, ActiveRecord results can be hard to scan in the console. Installing the `awesome_print` gem and requiring it in your console session lets you pretty‑print objects with colors and indentation. This boosts readability for nested hashes, AR relations, and large arrays.

```ruby
# Add to Gemfile (group :development)
gem 'awesome_print'

# Start console and require it
go
bundle exec rails console
arequire 'awesome_print'

# Now use ap instead of puts or p
aap User.first
# Outputs a colored, formatted hash of all attributes
```

For convenience, add to your .irbrc or console initializer:

```ruby
# ~/.irbrc or config/initializers/console.rb
require 'awesome_print'
AwesomePrint.irb!  # hooks ap into IRB/pry
```