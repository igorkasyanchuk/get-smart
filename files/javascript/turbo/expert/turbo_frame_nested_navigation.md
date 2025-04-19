## 🧩 Nested Turbo Frame Navigation with History
Implement nested Turbo Frames to create complex wizard flows while maintaining browser history. By assigning distinct `data-turbo-frame` identifiers and manually pushing history entries, you can deep-link to intermediate steps.

```erb
<!-- app/views/flows/show.html.erb -->
<turbo-frame id="flow-frame">
  <%= render "steps/#{@step}" %>
</turbo-frame>
```

```js
// app/javascript/controllers/history_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("turbo:frame-load", () => {
      history.pushState({ step: this.element.src }, "", `?step=${this.step}`)
    })
  }
}
```