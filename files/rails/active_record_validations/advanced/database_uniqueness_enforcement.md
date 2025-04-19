## 💾 Enforcing Uniqueness at Database Level

Model validations can race; always back them with a unique DB index. Wrap creates in a transaction and rescue `ActiveRecord::RecordNotUnique` to handle concurrent inserts gracefully.

```ruby
# db/migrate/XXXXXXXXXXXXXX_add_unique_index_to_users_email.rb
tclass AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
  end
end

# app/models/user.rb
class User < ApplicationRecord
  validates :email, uniqueness: true
end

# Usage
begin
  User.create!(email: 'dup@example.com')
rescue ActiveRecord::RecordNotUnique => e
  # handle duplicate entry
end
```