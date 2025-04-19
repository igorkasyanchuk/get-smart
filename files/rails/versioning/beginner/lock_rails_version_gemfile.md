## 🔒 Lock Rails Version in Gemfile

Specifying a strict Rails version in your Gemfile ensures your application stays on a tested release and prevents unexpected changes when new Rails versions are released. Use the `~>` operator to lock the major and minor version but still receive patch updates automatically.

```ruby
# Gemfile
gem 'rails', '~> 6.1.4'
```

After updating the Gemfile, run:

```bash
bundle install
```

This will install Rails 6.1.x (where x ≥ 4) and update your Gemfile.lock accordingly.
