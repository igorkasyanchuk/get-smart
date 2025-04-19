## 📦 Implement a Lazy Association Proxy

To defer loading expensive associations until use, wrap the association target in a proxy that intercepts missing methods. Only load data on first actual access, then forward method calls to the real object.

```ruby
class AssociationProxy
  def initialize(loader)
    @loader = loader
    @loaded = false
  end

  def method_missing(name, *args, &block)
    load_target unless @loaded
    @target.public_send(name, *args, &block)
  end

  def respond_to_missing?(name, include_private = false)
    load_target unless @loaded
    @target.respond_to?(name, include_private)
  end

  private

  def load_target
    @target = @loader.call
    @loaded = true
  end
end

# Usage in a model
class Post
  def comments
    @comments_proxy ||= AssociationProxy.new(-> { Comment.where(post_id: id).to_a })
  end
end
```