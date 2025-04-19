## 📦 Passing and Accessing Props in Your Component

Props (or arguments) let you customize the component’s output. Declare them in your component class using `with_*` or custom `attr_reader` methods. This ensures your component only exposes the data it needs.

```ruby
# app/components/hello_world_component.rb
class HelloWorldComponent < ViewComponent::Base
  # Declare a required prop named :greeting
  with_content_areas :footer
  def initialize(greeting:)
    @greeting = greeting
  end
end
```

```erb
<!-- app/components/hello_world_component.html.erb -->
<div class="hello">
  <p><%= @greeting %></p>
  <%= footer %>
</div>
```