## 🔍 Scoped Monkey-Patching with Refinements

Refinements let you override methods in a local scope without polluting the global namespace. Activate them with `using`.

```ruby
module StringExtensions
  refine String do
    def titleize
      split.map(&:capitalize).join(' ')
    end
  end
end

class BookFormatter
  using StringExtensions

  def format(title)
    title.titleize
  end
end

formatter = BookFormatter.new
formatter.format("the great gatsby") # => "The Great Gatsby"
String.new.titleize # => NoMethodError
```

Use refinements for library authors who need to patch core classes safely.