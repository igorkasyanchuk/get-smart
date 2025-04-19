## 🧪 Writing Integration Tests with stimulus-testing
Use the `@hotwired/stimulus-testing` library to simulate user interactions and assert controller responses in Jest. It wraps mounting and teardown, streamlining your test suite.

```javascript
import { Application } from "@hotwired/stimulus"
import { controllerTest } from "@hotwired/stimulus-testing"
import MyController from "../controllers/my_controller"

describe("MyController", () => {
  let application

  beforeEach(() => {
    application = Application.start()
    application.register("my", MyController)
  })

  afterEach(() => {
    application.stop()
  })

  controllerTest("toggles class on click", async ({ element }) => {
    element.innerHTML = `<button data-action="click->my#toggle"></button>`
    await element.click()
    expect(element.classList.contains("active")).toBe(true)
  })
})
```
