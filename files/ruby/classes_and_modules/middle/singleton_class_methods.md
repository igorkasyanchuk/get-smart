## 📌 Adding Methods to a Class’s Singleton Class

Directly define methods on a class’s singleton class to add class-level behavior without using modules. This keeps the methods local to that class only.

```ruby
class Report
  class << self
    def generate_summary(data)
      "Summary for \\#{data.size} items"
    end
  end
end

puts Report.generate_summary([1,2,3])
# => "Summary for 3 items"
```