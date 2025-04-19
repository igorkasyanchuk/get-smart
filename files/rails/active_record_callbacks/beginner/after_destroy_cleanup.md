## 🧹 Cleaning Up Related Records in `after_destroy`
Use `after_destroy` to perform cleanup tasks for records that should be removed after a model is deleted. Make sure the callback won’t interfere with database integrity.

```ruby
class User < ApplicationRecord
  after_destroy :remove_avatar_file

  private

  def remove_avatar_file
    File.delete(avatar_path) if avatar_path && File.exist?(avatar_path)
  end
end
```

This callback deletes the user’s avatar file from disk when the user record is destroyed.