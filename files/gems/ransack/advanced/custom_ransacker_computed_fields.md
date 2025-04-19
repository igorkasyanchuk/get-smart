## 🔧 Custom Ransacker for Computed Fields
When you need to search or sort on a field that doesn’t exist directly in your database (for example, a concatenated full name or a calculated score), you can define a custom ransacker in your model. This uses Arel to build the SQL expression and makes it available to Ransack queries.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  # Define a ransacker for full name (first_name + ' ' + last_name)
  ransacker :full_name, formatter: proc { |v| "%#{v.downcase}%" } do |parent|
    Arel::Nodes::NamedFunction.new(
      'LOWER',
      [
        Arel::Nodes::InfixOperation.new(:||,
          Arel::Nodes::InfixOperation.new(:||,
            parent.table[:first_name],
            Arel::Nodes.build_quoted(' ')
          ),
          parent.table[:last_name]
        )
      ]
    )
  end
end
``` 

You can now use `q[full_name_cont]` in your search form. Sorting also works with `sorts: 'full_name asc'`.