## 🌀 Building DSLs with instance_eval and class_eval

Create clean, internal DSLs by evaluating blocks in the context of target objects or classes. `instance_eval` is perfect for defining instance-level behavior, while `class_eval` (or `module_eval`) works for class-level constructs.

```ruby
class APIClient
def initialize(&block)
  instance_eval(&block) if block_given?
end

def endpoint(path)
  @endpoint = path
end

def method(name, &block)
  self.class.class_eval do
    define_method(name, &block)
  end
end
end

client = APIClient.new do
  endpoint '/users'
  method :get_users do
    get(@endpoint)
  end
end
```