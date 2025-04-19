## 🎨 Building a Fluent DSL in a Helper Module
Encapsulate complex HTML structures in a builder class to provide a fluent, chainable interface. This pattern moves presentation logic into a small DSL, keeping your views expressive and concise.

```ruby
# app/helpers/application_helper.rb
module ApplicationHelper
  def card_builder
    CardBuilder.new(self)
  end

  class CardBuilder
    def initialize(view); @view = view; end
    def title(text); @title = text; self; end
    def content(html); @content = html; self; end
    def to_html
      @view.content_tag(:div, class: 'card') do
        @view.concat @view.content_tag(:h3, @title)
        @view.concat @content
      end
    end
  end
end
```

Use in views:

```erb
<%= card_builder.title('Welcome').content(link_to('Get Started', signup_path)).to_html %>
```