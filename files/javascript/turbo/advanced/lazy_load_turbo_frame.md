## 🌀 Custom Turbo Frame Lazy Loading
Leverage the IntersectionObserver API to delay loading of heavy Turbo Frames until they enter the viewport. This reduces initial payload and improves perceived performance by loading content only when needed.

```javascript
// app/javascript/controllers/lazy_frame_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    const frame = this.element
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          frame.src = frame.dataset.src
          observer.disconnect()
        }
      })
    })
    observer.observe(frame)
  }
}
```
