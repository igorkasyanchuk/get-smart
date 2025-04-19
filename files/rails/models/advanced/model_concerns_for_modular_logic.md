## 🧩 Modularizing Model Logic with Concerns

Use ActiveSupport::Concern to extract reusable logic (associations, callbacks, instance methods) into modules and keep your models small. Concerns can bundle related methods, validations, and callbacks, and you can include them in multiple models without repeating code.

```ruby
# app/models/concerns/commentable.rb
module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable, dependent: :destroy
    before_destroy :log_comments_count
  end

  def comment_count
    comments.count
  end

  private

  def log_comments_count
    Rails.logger.info "Deleting \\#{comments.count} comments"
  end
end

# app/models/post.rb
class Post < ApplicationRecord
  include Commentable
end

# app/models/image.rb
class Image < ApplicationRecord
  include Commentable
end
```
