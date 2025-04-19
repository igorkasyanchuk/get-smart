## 📝 Leveraging diffable for Improved Failure Messages

When comparing complex objects, adding `diffable` in your matcher enables side-by-side diffs on failure. You capture both expected and actual values, then let RSpec show granular differences automatically.

```ruby
# spec/support/matchers/have_person_attributes.rb
RSpec::Matchers.define :have_person_attributes do |expected|
  match do |actual|
    @actual = actual.attributes.slice('name', 'age', 'email')
    @expected = expected.slice(:name, :age, :email)
    @actual == @expected
  end

  diffable

  failure_message do
    "expected person to have attributes #{expected.inspect}, but got #{@actual.inspect}"
  end
end
```

Usage:

```ruby
person = Person.new(name: 'Alice', age: 30, email: 'a@example.com')
expect(person).to have_person_attributes(name: 'Bob', age: 30, email: 'a@example.com')
```