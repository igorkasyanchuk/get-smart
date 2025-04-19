## 🌐 Generating Multilingual Data Streams

Faker supports arrays of locales, allowing each lookup to randomly choose a locale from the set. This is great for simulating multilingual datasets in one go without manually switching contexts.

```ruby
# Generate 10 user profiles with mixed English, French, and Japanese names:
Faker::Config.locale = [:en, :fr, :ja]

10.times.map do
  {
    name: Faker::Name.name,
    city: Faker::Address.city,
    quote: Faker::Quote.matz
  }
end
```

Each call to `Faker::Name.name`, `Faker::Address.city`, etc., randomly picks one of the specified locales under the hood, producing a realistic polyglot dataset.