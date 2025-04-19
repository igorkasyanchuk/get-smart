## 🔒 Choosing public_send over send for Safer Metaprogramming

While `send` lets you call any method (public, protected, or private), `public_send` restricts calls to public methods, reducing the risk of unintentionally bypassing encapsulation. Prefer `public_send` when you don't need to access private methods.

```ruby
class Secret
  def public_method
    'public'
  end
  private
def private_method
    'secret'
  end
end

obj = Secret.new
obj.public_send(:public_method)   #=> "public"
obj.public_send(:private_method)  #=> NoMethodError
obj.send(:private_method)         #=> "secret"  # Avoid unless necessary
```