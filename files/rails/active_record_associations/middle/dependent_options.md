## ⚙️ Managing Lifecycle with `dependent` Options

Use the `dependent:` option on associations to automatically handle cleanup of related records. Options such as `:destroy`, `:delete_all`, `:nullify`, or `:restrict_with_error` control how Rails treats dependents when the parent is removed. Choosing the right strategy prevents orphaned rows or unintended deletes.

```ruby
class User < ApplicationRecord
  has_many :posts, dependent: :destroy      # calls `destroy` on each post
  has_many :comments, dependent: :nullify  # sets `user_id` to NULL
  has_many :logs, dependent: :delete_all   # deletes directly via SQL
end
```
