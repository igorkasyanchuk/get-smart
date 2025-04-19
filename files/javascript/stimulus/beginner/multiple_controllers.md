## 🔀 Attaching Multiple Controllers

You can attach multiple controllers to a single element by listing them in `data-controller`. This allows composition of behaviors.

```html
<div data-controller="hello counter">
  <input data-hello-target="name" placeholder="Name">
  <button data-action="click->hello#greet">Greet</button>
  <button data-action="click->counter#increment">Count</button>
  <div data-counter-target="value" data-counter-count-value="0"></div>
</div>
```

Each controller will manage its own targets and actions independently.