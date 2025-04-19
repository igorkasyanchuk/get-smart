## 🧠 Offload Heavy Computations to WebWorkers

For CPU‑intensive tasks, delegate work to WebWorkers and communicate back via `postMessage`. Stimulus controllers can spin up workers in `connect()` and tear them down in `disconnect()`, avoiding memory leaks.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.worker = new Worker(new URL("../workers/heavy_task.js", import.meta.url))
    this.worker.onmessage = event => this.handleResult(event.data)
  }

  disconnect() {
    this.worker.terminate()
  }

  handleResult(data) {
    this.element.textContent = `Result: ${data}`
  }

  runTask() {
    this.worker.postMessage({ payload: this.data.get("payload") })
  }
}
```