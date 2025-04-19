## ✨ Create Class Macros with the Eigenclass
Use the singleton class (eigenclass) to define DSL‑style class macros that enhance readability of your models or services.

```ruby
class Report
  class << self
    def column(name, &block)
      @columns ||= {}
      @columns[name] = block
    end

    def columns
      @columns
    end
  end

  column :total do |data|
    data.sum(&:amount)
  end
end

puts Report.columns  # => {:total=>#<Proc...>}
```