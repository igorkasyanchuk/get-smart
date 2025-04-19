## 🖌️ Theming via Data-Controller Attributes

Use Stimulus to apply theme changes dynamically by toggling data-controller attributes or modifying CSS variables on the root. This allows for interactive theming without a full page reload.

```html
<button data-action="click->theme#toggle">Toggle Theme</button>
```

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggle() {
    document.documentElement.classList.toggle("dark-theme")
  }
}
```
