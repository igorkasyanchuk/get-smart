## ⚡ TypeScript Decorators with Stimulus
Leverage TypeScript decorators to annotate targets and values succinctly. Decorators reduce boilerplate and improve type safety when working in a TS codebase.

```typescript
import { Controller } from "@hotwired/stimulus"
import { target, value } from "stimulus-decorators"

export default class extends Controller {
  @target declare button: HTMLElement
  @value declare count: number

  connect() {
    this.button.addEventListener("click", () => this.increment())
  }

  increment() {
    this.countValue++
  }
}
```
