## 🔁 Building macros via `included` callback
Define class macros by intercepting `self.included` in modules, injecting class methods, and managing inheritance cleanly.

```ruby
module ActsAsTaggable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_taggable
      has_many :tags
    end
  end
end

class Post
  include ActsAsTaggable
  acts_as_taggable
end
```