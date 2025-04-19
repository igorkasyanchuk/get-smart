## 🔧 Hot-Reloading Constants with `remove_const` and `load`

In development or REPL scenarios, you can unload and reload constants to pick up code changes without restarting the process. Use `Module#remove_const` followed by `load` to refresh a class or module definition, but beware of stale references elsewhere.

```ruby
module DataModels
  def self.reload_model(name)
    const_name = name.to_sym
    remove_const(const_name) if const_defined?(const_name)
    load "data_models/#{name.downcase}.rb"
  end
end

# After editing data_models/user.rb, run:
DataModels.reload_model('User')
# Now DataModels::User is the updated class
```