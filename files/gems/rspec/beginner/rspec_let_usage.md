## 🎛 Using let for Memoization

`let` defines a memoized helper method. It's lazily evaluated and cached per example. This helps avoid using instance variables and keeps setup clear.

```ruby
RSpec.describe User do
  let(:user) { User.new(name: 'Alice') }

  it 'has the correct name' do
    expect(user.name).to eq('Alice')
  end
end
```
