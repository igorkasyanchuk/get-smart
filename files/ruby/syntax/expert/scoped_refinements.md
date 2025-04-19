## 💡 Scoped Monkey Patching with Refinements

Use refinements to locally override core methods without polluting global scope—ideal for DSLs or test helpers. Define your patch in a module, then activate it using `using` only in the affected context.

```ruby
module StringNormalizer
  refine String do
    def normalize
      downcase.strip.gsub(/\s+/, "_")
    end
  end
end

class FilenameGenerator
  using StringNormalizer

  def call(name)
    "file_#{name.normalize}.txt"
  end
end

p FilenameGenerator.new.call(" Hello WORLD ")
# => "file_hello_world.txt"
```