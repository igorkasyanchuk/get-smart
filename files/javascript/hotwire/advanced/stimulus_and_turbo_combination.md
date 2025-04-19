## 🚀 Combining Stimulus and Turbo for Complex Flows
Orchestrate multi‑step wizards by using Turbo Frames to load steps and Stimulus to manage transitions. This allows a clean separation of navigation and component logic.

```html
<turbo-frame id="wizard-frame" src="/wizard/step1"></turbo-frame>
```

```javascript
import { Controller } from 'stimulus'
export default class extends Controller {
  nextStep(event) {
    event.preventDefault()
    const url = event.target.dataset.nextUrl
    document.getElementById('wizard-frame').src = url
  }
}
```

Each step’s view includes a Stimulus‑wired “Next” button pointing to the next URL.