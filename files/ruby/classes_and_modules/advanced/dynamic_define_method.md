## 🔧 Dynamic Method Definition with `define_method`

You can DRY up repetitive method patterns by dynamically defining them using `define_method`. This is especially useful for building attribute-like methods or command methods based on a list.

```ruby
class Report
  %i[summary details statistics].each do |action|
    define_method("generate_#{action}") do |options = {}|
      puts "Generating #{action} with "+options.inspect
      # ... implementation ...
    end
  end
end

report = Report.new
report.generate_summary(format: :pdf)  # => "Generating summary with {:format=>:pdf}"
```

Alternatively, you can use `class_eval` for more complex definitions, interpolating method bodies dynamically.