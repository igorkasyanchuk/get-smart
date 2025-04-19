## 🔍 Prefetch Links to Speed Up Navigation

You can prefetch pages by adding `data-turbo-preload` to links. Turbo will fetch and cache the target URL in advance, making subsequent visits nearly instantaneous.

```html
<a href="/articles/1" data-turbo-preload="true">Read Article</a>
```
