## 🤖 Use SimpleDelegator for Wrapper Objects

When wrapping another object to extend or modify behavior, inherit from SimpleDelegator. You avoid rewriting every forwarding method.

```ruby
require 'delegate'

class UserPresenter < SimpleDelegator
  def display_name
    "**#{name.upcase}**"
  end
end

user = OpenStruct.new(name: 'Bob')
presenter = UserPresenter.new(user)
puts presenter.display_name # **BOB**
puts presenter.name         # Bob
```