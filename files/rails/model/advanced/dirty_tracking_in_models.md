## 🕵️‍♂️ Use ActiveModel::Dirty to track attribute changes

Track what changed before saving:

```ruby
class User < ApplicationRecord
  before_save :log_email_change, if: :will_save_change_to_email?

  private

  def log_email_change
    puts "Email changed from #{email_was} to #{email}"  
  end
end
```

Useful for auditing or triggering side effects only on change.