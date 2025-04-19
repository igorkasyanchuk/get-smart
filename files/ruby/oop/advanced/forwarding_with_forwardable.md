## 🎯 Delegate Methods Cleanly with `Forwardable`
The `Forwardable` module lets you delegate specific methods to an internal object, reducing boilerplate and improving encapsulation.

```ruby
require 'forwardable'

class UserDecorator
  extend Forwardable

  def initialize(user)
    @user = user
  end

  def_delegators :@user, :name, :email

  def formatted_email
    "#{name} <#{email}>"
  end
end

user = OpenStruct.new(name: 'Jane', email: 'jane@example.com')
decorator = UserDecorator.new(user)
puts decorator.formatted_email  # => "Jane <jane@example.com>"
```