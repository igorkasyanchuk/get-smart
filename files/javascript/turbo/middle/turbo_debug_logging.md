## 🐞 Debug Turbo with Console Logging

Turbo provides a verbose logging mode for deeper debugging. Enable `window.Turbo.logger.enabled = true` before importing Turbo to see lifecycle events and errors in your browser console.

```javascript
// Place this before importing turbo.js
window.Turbo = { logger: { enabled: true, log: console.log } };
import { Turbo } from '@hotwired/turbo';
```
