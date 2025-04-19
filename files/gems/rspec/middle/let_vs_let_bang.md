## 💡 Using `let` vs `let!`

Use `let` for lazy initialization and `let!` when you need data set up before each example runs. `let` only creates the object when referenced, while `let!` forces evaluation in a `before` hook. This helps optimize tests and avoid unexpected side effects.

```ruby
RSpec.describe Order do
  let(:user) { create(:user) }
  let!(:order) { create(:order, user: user) }

  it "associates the order with the user" do
    expect(order.user).to eq(user)
  end
end
```
