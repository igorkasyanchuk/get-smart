## 📝 Building a DSL with instance_eval

`instance_eval` lets you execute a block in the context of an object, which is the cornerstone of many Ruby DSLs. Use it to create clean, readable configuration blocks.

```ruby
class TableBuilder
  def initialize
    @columns = []
  end

  def column(name, type)
    @columns << { name: name, type: type }
  end

  def build(&block)
    instance_eval(&block)
    @columns
  end
end

columns = TableBuilder.new.build do
  column :id,   :integer
  column :name, :string
end

p columns
# => [{:name=>:id, :type=>:integer}, {:name=>:name, :type=>:string}]
```