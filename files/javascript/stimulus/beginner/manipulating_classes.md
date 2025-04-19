## ✨ Manipulating Classes Dynamically

Add or remove CSS classes from elements to show or hide styles. Use `classList` for direct manipulation.

```javascript
// tab_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["tab", "panel"]

  switch(event) {
    this.tabTargets.forEach(t => t.classList.remove("active"))
    this.panelTargets.forEach(p => p.classList.remove("active"))

    event.currentTarget.classList.add("active")
    const index = this.tabTargets.indexOf(event.currentTarget)
    this.panelTargets[index].classList.add("active")
  }
}
```

```html
<ul data-controller="tab">
  <li data-tab-target="tab" data-action="click->tab#switch">Tab 1</li>
  <li data-tab-target="tab" data-action="click->tab#switch">Tab 2</li>
</ul>
<div data-tab-target="panel">Panel 1</div>
<div data-tab-target="panel">Panel 2</div>
```