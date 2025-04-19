## 🔍 Track Changes with Dirty Attributes

Active Record’s dirty tracking lets you detect changes before and after saving a record. Use methods like `changed?`, `attribute_changed?`, and `saved_changes` to trigger conditional logic or audit logs. This helps you respond to user modifications precisely.

```ruby
class Profile < ApplicationRecord
  before_update :log_email_change, if: :will_save_change_to_email?

  private

  def log_email_change
    Rails.logger.info "Email changed from \\#{email_change.first} to \\#{email_change.last}" 
  end
end
```