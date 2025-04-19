## ⚙️ Combine Multiple Columns Using Arel in a Custom Ransacker

Create a composite `full_name` ransacker that concatenates first and last names, normalizes casing, and even strips accents for robust searching. This uses low-level Arel nodes and Postgres’ `unaccent` extension to handle international names seamlessly.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  ransacker :normalized_full_name do |parent|
    fn = Arel::Nodes::NamedFunction
    concat = Arel::Nodes::InfixOperation.new(
      '||',
      parent.table[:first_name],
      Arel::Nodes::InfixOperation.new('||', fn.new('unaccent', [Arel::Nodes.build_quoted(' ')]), parent.table[:last_name])
    )
    fn.new('LOWER', [fn.new('unaccent', [concat])])
  end
end
```

Usage:

```ruby
# case-insensitive, accent-insensitive search
User.ransack(normalized_full_name_eq: 'josé silva').result
```