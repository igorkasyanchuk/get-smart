## 🛡️ Enforcing DB Constraints in Parallel
Complement Rails validations with database constraints to avoid race conditions and ensure data integrity at scale. Use migrations to add unique or check constraints, then rescue and normalize database errors into model errors.

```ruby
# db/migrate/20240101000000_add_unique_index_to_users_email.rb
class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true, name: 'index_users_on_email_unique'
  end
end

# app/models/user.rb
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  rescue_from ActiveRecord::RecordNotUnique do |exception|
    errors.add(:email, :taken, message: 'has already been registered')
  end
end
```