## 🌳 Nest Doubles for Complex Dependency Trees

For classes that interact with deep object graphs, nest doubles to mirror structure without instantiating real objects. This reduces fixture setup and speeds up tests.

```ruby
profile_double = double("Profile", age: 30, country: "US")
user_double = double("User", name: "Bob", profile: profile_double)
allow(UserService).to receive(:fetch).and_return(user_double)

result = UserService.fetch(42).profile.country
expect(result).to eq("US")
```

This approach cleanly isolates the unit under test from nested collaborators.