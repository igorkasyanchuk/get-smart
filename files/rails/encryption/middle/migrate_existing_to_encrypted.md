## 🔄 Migrating Existing Data to Encrypted Columns

When adding encryption to a live app, migrate current plaintext data into the new encrypted columns via a one‑off migration or rake task. This ensures consistency and atomicity.

```ruby
# db/migrate/20240101000000_add_encrypted_email_to_users.rb
class AddEncryptedEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :encrypted_email, :string
  end
end
```

```ruby
# lib/tasks/encrypt_existing_data.rake
namespace :db do
  desc 'Encrypt existing user emails'
  task encrypt_emails: :environment do
    User.find_each do |user|
      user.update!(email: user.email) # triggers encrypts :email in model
    end
  end
end

# Run:
# rails db:migrate && rails db:encrypt_emails
```