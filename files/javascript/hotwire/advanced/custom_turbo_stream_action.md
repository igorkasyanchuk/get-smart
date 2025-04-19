## 🛠️ Custom Turbo Stream Actions
Define your own Turbo Stream actions (e.g., `turbo-stream action="highlight"`) via JavaScript. This allows bespoke DOM transformations beyond the built‑in actions.

```javascript
import { StreamActions } from "@hotwired/turbo"

StreamActions.highlight = ({ target, template }) => {
  const element = document.getElementById(target)
  element.insertAdjacentHTML('beforeend', template)
  element.classList.add('flash-highlight')
  setTimeout(() => element.classList.remove('flash-highlight'), 2000)
}
```

Now use `<turbo-stream action="highlight" target="posts">` to leverage it.