## 📝 Inspect Available Methods
Reflective programming often starts with discovering what methods an object or class provides. Use the `methods` or `instance_methods` reflection APIs to list available methods and explore an object's capabilities.

```ruby
# List all public methods of an object
"hello".methods.sort.take(10)
#=> [:%, :* , :+ , :< , :<= , :<< , :<=? , :<=> , :== , :===]

# List instance methods defined on String class (excluding inherited ones)
String.instance_methods(false)
#=> [:swapcase, :swapcase!, :next, :next!, ...]
```

By inspecting methods, you can learn what operations are supported before calling them dynamically.