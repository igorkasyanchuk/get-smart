## 🚪 Lazy-Load Controllers in Modals

Modals often hold many controllers that aren’t needed until opened. Use `MutationObserver` to detect when the modal content is injected and then call `application.load()` or dynamic import.

```javascript
import { Application } from '@hotwired/stimulus'
const application = Application.start()

const observer = new MutationObserver(mutations => {
  mutations.forEach(m => {
    if (m.addedNodes.length && m.target.id === 'modal-container') {
      // load controllers inside modal
      application.load(m.addedNodes[0])
    }
  })
})

observer.observe(document.body, { childList: true, subtree: true })
```