## 🎯 Advanced Targeting with Turbo Streams
Leverage multiple `target` attributes to apply one stream to various elements. Use a comma‑separated list or CSS selectors.

```html
<turbo-stream action="remove" target=".notification, #alert-banner">
  <template></template>
</turbo-stream>
```

Turbo will find each matching element and apply the specified action against them all.