## 🏗️ Building Internal DSLs with instance_eval

Design clean, expressive internal DSLs by instance_eval-ing on a context object so that block code runs in its scope. This technique hides boilerplate and makes domain-specific configurations read naturally.

```ruby
class RouteBuilder
  def initialize(&block)
    instance_eval(&block)
  end

  def get(path, &action)
    puts "Registered GET #{path}"
    @routes ||= {}
    @routes[path] = action
  end

  def draw(&block)
    @routes = {}
    instance_eval(&block)
    @routes
  end
end

routes = RouteBuilder.new.draw do
  get '/home' do
    'home#index'
  end
  get '/about' do
    'about#show'
  end
end

p routes #=> {"/home"=>#<Proc...>, "/about"=>#<Proc...>}
```