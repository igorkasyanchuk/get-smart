## 🎯 Advanced Pattern Matching with `in`

Ruby 2.7+ supports structural pattern matching via `case … in`, allowing concise deconstruction of nested data. You can capture values, use the pin operator (`^`) to match existing variables, and leverage `=>` to bind the entire matched object.

```ruby
case { status: :ok, data: { id: 42, name: "Alice" } }
in { status: :ok, data: { id:, name: } }
  puts "ID=#{id}, Name=#{name}"
in { status: :error, error: } => err_obj
  puts "Error: #{err_obj[:error]}"
end
```