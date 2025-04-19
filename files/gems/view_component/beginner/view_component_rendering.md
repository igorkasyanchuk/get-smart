## 🎨 Rendering a ViewComponent in Your Views

Once your component is generated, you can render it just like you would render a partial. This makes it easy to encapsulate complex UI logic in simple Ruby objects. Replace your ERB partial calls with a `render` call to your component class.

```erb
<%# app/views/home/index.html.erb %>
<%= render HelloWorldComponent.new(greeting: 'Hello, Rails!') %>
```

By passing in the `greeting` argument, your component has everything it needs to render itself with the provided data.