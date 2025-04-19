## 🧪 Testing Controllers with Jest

Write unit tests for Stimulus controllers by mocking the HTML structure and invoking lifecycle callbacks. Use JSDOM to simulate the DOM in Jest.

```js
import { Application } from "@hotwired/stimulus"
import MyController from "../controllers/my_controller"

document.body.innerHTML = ` <div data-controller="my" data-my-value="5"></div> `

const application = Application.start()
application.register("my", MyController)

test("increments count on connect", () => {
  const el = document.querySelector("[data-controller=my]")
  const controller = application.getControllerForElementAndIdentifier(el, "my")
  controller.increment()
  expect(el.textContent).toContain("Count: 1")
})
```
