## 🔥 Create a Custom Template Handler
Extend Rails view rendering by writing your own template handler. For example, integrate HAML-like features or dynamic preprocessing.

```ruby
# lib/template_handlers/md.rb
module TemplateHandlers
  class Md
    def call(template)
      compiled = MarkdownConverter.convert(template.source)
      "ActionView::OutputBuffer.new.safe_concat(#{compiled.inspect})"
    end
  end
end

ActionView::Template.register_template_handler :md, TemplateHandlers::Md.new
```

Now Rails will process `*.html.md` templates via your handler.