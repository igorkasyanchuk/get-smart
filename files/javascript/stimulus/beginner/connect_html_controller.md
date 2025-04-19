## 🔗 Connecting Controller to HTML

Stimulus uses `data-controller` attributes to link HTML elements to controllers. This makes it simple to add behavior without inline scripts.

```html
<!-- app/views/home/index.html.erb -->
<div data-controller="hello">
  <h1>Hello, Stimulus!</h1>
</div>
```

With this, `hello_controller.js` will automatically connect when the page loads.