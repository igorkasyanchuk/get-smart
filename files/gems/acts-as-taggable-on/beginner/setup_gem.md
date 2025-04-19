## 🏷️ Install and configure the gem

Add `acts-as-taggable-on` to your Gemfile to enable tagging in your Rails app. Run the installer to generate migrations that create the necessary tables, then migrate your database to apply them.

```bash
# Gemfile
gem 'acts-as-taggable-on'

# Install the gem
bundle install

# Generate and run migrations
rails generate acts_as_taggable_on:migration
rails db:migrate
```