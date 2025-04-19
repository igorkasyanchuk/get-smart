## 🔢 Generating Unique Values with Faker

Faker’s `UniqueGenerator` ensures that sequential calls don’t return duplicates, which is crucial when you seed data that requires unique fields (e.g., emails). Remember to clear the unique registry when you need a fresh sequence in a new context (like different test cases).

```ruby
# Generate 5 unique names
def generate_unique_names
  5.times { puts Faker::UniqueGenerator.unique.name }
end

generate_unique_names
# => “Alice Smith”, “Bob Jones”, ... (all guaranteed unique)

# Reset the unique tracker between test runs or seeding tasks
Faker::UniqueGenerator.clear
```