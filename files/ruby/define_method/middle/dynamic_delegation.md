## 🌀 Dynamic Delegation

When you have multiple similar targets to delegate to, `define_method` can generate delegation methods dynamically instead of writing each one by hand.

```ruby
class Presenter
  def initialize(model)
    @model = model
  end

  [:title, :author, :published_at].each do |attr|
    define_method(attr) do
      @model.public_send(attr).to_s.upcase
    end
  end
end

book = OpenStruct.new(title: "Metaprogramming", author: "Jane", published_at: Date.today)
presenter = Presenter.new(book)
puts presenter.title        # => "METAPROGRAMMING"
puts presenter.published_at # => "2024-06-15"
```

This approach keeps your presenter lean and auto-generates methods based on a list of attributes.