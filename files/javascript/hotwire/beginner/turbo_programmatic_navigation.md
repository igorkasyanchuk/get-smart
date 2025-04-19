## 🏃 Programmatic Navigation with Turbo.visit

Turbo exposes a `Turbo.visit` method for navigating via JavaScript. Use it for custom link handling.

```javascript
import { Turbo } from "@hotwired/turbo-rails"

document.getElementById("my-button").addEventListener("click", () => {
  Turbo.visit("/dashboard")
})
```  
This performs a Turbo Drive visit to `/dashboard`, updating the page without a full reload.