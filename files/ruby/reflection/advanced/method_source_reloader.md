## ✨ Reload and Patch Method Source at Runtime
Combine `Method#source_location` with file I/O and `Module#module_eval` to reload or patch a method’s implementation on the fly. This pattern is powerful for live patching in long‑running processes or during debugging.

```ruby
# Locate and reload method from its source file
def reload_method(klass, method_name)
  file, line = klass.instance_method(method_name).source_location
  src = File.readlines(file)[line-1..-1].take_while{|l| !l.match(/^end/) }.join
  klass.module_eval("def #{method_name}\n#{src}\nend")
end

# Example: patch User#greet
class User; def greet; 'hi'; end; end
# Edit user.rb on disk to change greet implementation
reload_method(User, :greet)
puts User.new.greet  # reflects updated source
```