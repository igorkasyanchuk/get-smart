## 📦 Leverage Struct for Lightweight Data Objects

For simple containers of attributes, use Struct instead of writing boilerplate classes. You get an initializer, accessors, equality, and `to_s` for free.

```ruby
Customer = Struct.new(:id, :name, :email) do
  def valid?
    email.include?('@')
  end
end

c = Customer.new(1, 'Alice', 'alice@example.com')
puts c.name   # Alice
puts c.valid? # true
```