## 🧠 Manipulating Local Variables with Binding for Metaprogramming

Ruby 2.1+ introduced `Binding#local_variable_get` and `#local_variable_set`, which let you introspect and inject locals at runtime—empowering DSLs and dynamic code transforms. You can seed a binding with variables, evaluate complex expressions in that scope, or even snapshot local values before/after block execution.

```ruby
b = binding
b.local_variable_set(:user, 'Alice')
result = eval '"User: #{user}"', b   #=> "User: Alice"

# Capture and modify existing locals:
count = 5
b2 = binding
puts b2.local_variable_get(:count)    #=> 5
b2.local_variable_set(:count, 10)
puts eval('count', b2)                #=> 10
```