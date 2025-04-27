### 🚀 Stimulus JS Tip: Handling Input Changes with Targets

In Stimulus JS, using `data-[controller]-target` lets you quickly access specific elements within your controller.

**Example:**

```html
<div data-controller="example">
  <input type="text" data-example-target="nameInput">
  <button data-action="click->example#greet">Greet</button>
</div>

<script type="module">
  import { Controller } from "@hotwired/stimulus"

  export default class extends Controller {
    static targets = ["nameInput"]

    greet() {
      alert(`Hello, ${this.nameInputTarget.value}!`)
    }
  }
</script>
```
