## 🔑 Dynamic OmniAuth Provider Setup

For scenarios where OAuth providers change at runtime, load provider credentials from the database into Devise on each boot. Wrapping in `Devise.setup` ensures strategies register correctly across environments.

```ruby
# config/initializers/devise.rb
Devise.setup do |config|
  Provider.active.each do |provider|
    config.omniauth provider.name.to_sym,
                     provider.app_id,
                     provider.app_secret
  end
  # ... other Devise config
end
```
