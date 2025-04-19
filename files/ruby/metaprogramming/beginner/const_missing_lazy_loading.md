## 🎯 Lazy Load Constants with `const_missing`

`const_missing` is triggered when an undefined constant is accessed. You can use it to autoload classes or modules on demand, keeping startup time low and dependencies minimal.

```ruby
module AutoLoader
  def const_missing(name)
    file = "./#{name.to_s.downcase}.rb"
    require file if File.exist?(file)
    const_get(name)
  end
end

class MyApp
  extend AutoLoader
end

# Accessing MyApp::User triggers require './user.rb'
# user = MyApp::User.new
```