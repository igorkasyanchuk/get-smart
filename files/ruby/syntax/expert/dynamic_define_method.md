## 🔧 Dynamic Method Definition with `define_method` and `__method__`

Use `define_method` within loops or factories to programmatically declare methods. Access `__method__` or `__callee__` inside the block for introspection or logging without hardcoding names.

```ruby
%w[start stop restart].each do |action|
  define_method(action) do |service|
    puts "#{__method__.upcase}: #{service}"
    # call systemctl or other command...
  end
end

# Now you have start, stop, restart as instance methods
device = Object.new
device.start("nginx")
```