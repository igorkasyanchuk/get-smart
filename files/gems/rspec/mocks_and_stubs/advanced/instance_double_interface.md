## 🧪 Enforce Interface with `instance_double`

Using `instance_double` helps you catch typos and ensure your test doubles adhere to the real object’s public interface. By verifying against the actual class, you avoid scenarios where your mocks drift out of sync with production code.

```ruby
# Verifies User responds to :name and :email
user_double = instance_double("User", name: "Alice", email: "alice@example.com")
allow(User).to receive(:find).with(1).and_return(user_double)

expect(User.find(1).email).to eq("alice@example.com")
```
