## 🔧 Defining Custom Actions with Modifiers

Stimulus actions can include modifiers like `once`, `prevent`, and `stop` to reduce boilerplate. Combine custom methods with modifiers on your data-action attribute for concise event handling.

```html
<div data-controller="menu">
  <button data-action="click->menu#open once prevent">Open Menu</button>
</div>
```

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open() {
    console.log("Menu opened only once and default prevented")
  }
}
```
