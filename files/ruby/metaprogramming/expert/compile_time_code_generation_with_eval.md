## 📝 Compile-time Code Generation with eval and Templates

Generate boilerplate code at class load time by building method definitions dynamically and passing them into `class_eval`. This meta-compile step can drastically reduce duplication in large, similarly structured modules.

```ruby
class Serializer
  %w[string integer float].each do |type|
    class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def serialize_#{type}(value)
        convert_#{type}(value)
      end
    RUBY
  end

  private

  def convert_string(v); v.to_s; end
  def convert_integer(v); v.to_i; end
  def convert_float(v); v.to_f; end
end

s = Serializer.new
puts s.serialize_string(123) # => "123"
```