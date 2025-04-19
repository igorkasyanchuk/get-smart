## 🎯 Using Targets for Element References

Targets let you reference specific elements within your controller scope. Define targets in your controller and then mark them in the HTML.

```javascript
// hello_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["name"]

  greet() {
    alert(`Hello, ${this.nameTarget.value}!`)
  }
}
```

```html
<input data-hello-target="name" placeholder="Enter name">
<button data-action="click->hello#greet">Greet</button>
```