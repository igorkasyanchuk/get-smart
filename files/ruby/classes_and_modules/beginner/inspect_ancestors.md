## 🔍 Inspect Inheritance with `ancestors`

The `ancestors` method returns a list of modules and classes included in the lookup chain. It helps you understand how Ruby resolves method calls and where methods come from.

```ruby
module A; end
class B; include A; end
class C < B; end

puts C.ancestors
# => [C, B, A, Object, Kernel, BasicObject]
```