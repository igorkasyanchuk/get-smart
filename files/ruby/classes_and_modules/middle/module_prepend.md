## 🧩 Using Module#prepend for Method Overrides

`Module#prepend` lets you inject behavior before existing methods are invoked, making it excellent for decorators or logging. Unlike `include`, `prepend` places the module higher in the lookup chain. Use it to wrap or modify method behavior transparently.

```ruby
module Auditor
  def save
    puts "Auditing before save"
    super
  end
end

class Record
  prepend Auditor

  def save
    puts "Saving record"
  end
end

Record.new.save
# ⇒ Auditing before save
# ⇒ Saving record
```