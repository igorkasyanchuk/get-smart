## 💤 Lazy Loading with Intersection Observer and Turbo Frames
Combine Intersection Observer with Turbo Frames to lazy-load offscreen content. This reduces initial payloads and defers non-critical frames until the user scrolls.

```js
// app/javascript/controllers/lazy_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) entry.target.src = entry.target.dataset.src
      })
    }).observe(this.element)
  }
}
```

```erb
<turbo-frame id="comments" data-controller="lazy" data-src="/posts/1/comments"></turbo-frame>
```