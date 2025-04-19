## 🎯 Nested Targets Usage

Targets let you reference child elements easily, even within nested structures. Use `static targets` and the automatically generated getters to handle elements by their data-target attributes.

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "button"]

  connect() {
    this.itemTargets.forEach((el, idx) => {
      el.textContent = `Item ${idx + 1}`
    })
  }

  onButtonClick(event) {
    const index = this.buttonTargets.indexOf(event.currentTarget)
    this.itemTargets[index].classList.toggle("highlight")
  }
}
```
