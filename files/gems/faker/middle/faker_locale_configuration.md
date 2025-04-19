## 🌐 Customizing Faker Locales

Faker supports generating data in multiple languages out of the box. You can set a global locale in your test setup or wrap specific blocks with `with_locale` to generate data only for that scope. This is invaluable when you need region‑specific names, addresses, or company data.

```ruby
# Set a global locale (e.g., Japanese)
Faker::Config.locale = 'ja'
puts Faker::Name.first_name   # => “拓海”
puts Faker::Address.city      # => “札幌市”

# Temporarily switch to French for a block
a = Faker::Name.with_locale(:fr) do
  Faker::Address.city       # => “Saint‑Denis”
end
```