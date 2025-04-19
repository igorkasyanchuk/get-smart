## 📂 Control Load Order with Sprockets Directives
Use `require_self` and `require_tree` in your manifest to explicitly manage load order. `require_self` includes the file’s own contents at that position.

```js
// app/assets/javascripts/application.js
//= require rails-ujs
//= require turbolinks
//= require_self
//= require_tree ./modules

console.log('Main app bundle loaded');
```

This ensures core libs load first, then your inline code, followed by everything under `modules/`, preserving predictable execution order.