## 🌱 Lazy‑Load Turbo Frames with IntersectionObserver

Combine Turbo Frames with the Intersection Observer API to defer loading offscreen frames. This technique reduces initial payloads and accelerates perceived page load.

```js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["frame"];

  connect() {
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.src = entry.target.dataset.src;
          observer.unobserve(entry.target);
        }
      });
    });

    observer.observe(this.frameTarget);
  }
}
```

In your view:

```erb
<turbo-frame id="feed" data-controller="lazy-load" data-lazy-load-target="frame" data-src="/feed" src="about:blank"></turbo-frame>
```