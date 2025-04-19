## 🎨 Conditionally Mapping Classes via SCSS
Stimulus can interface with SCSS variables by toggling classes defined in your stylesheets. Use `classMap` pattern to switch modifier classes based on state.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ["active", "inactive"]

  connect() {
    this.toggleClasses()
  }

  toggleClasses() {
    this.element.classList.toggle(this.activeClass)
    this.element.classList.toggle(this.inactiveClass)
  }
}

// In your SCSS
// .box { ... }
// .box--active { background: green; }
// .box--inactive { background: red; }
```
