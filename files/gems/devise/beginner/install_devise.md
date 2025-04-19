## 🛠️ Install and Set Up Devise
Add the `devise` gem to your Gemfile to bring in authentication functionality, then install it and generate the initial configuration. This step creates an initializer and gives you guidance onsetting up mailer options, which Devise uses for password resets and confirmations.

```bash
bundle add devise
rails generate devise:install
```

After installation, configure the default URL options so Devise can generate proper links in emails:

```ruby
# config/environments/development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
