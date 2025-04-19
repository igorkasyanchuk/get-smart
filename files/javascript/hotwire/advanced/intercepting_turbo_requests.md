## 🛡️ Intercepting Turbo Fetch Requests
Override Turbo’s network handling to inject headers or log requests. Use this to add authentication tokens for API‑driven frames.

```javascript
import { FetchRequest } from "@hotwired/turbo"

class AuthFetchRequest extends FetchRequest {
  get headers() {
    return { ...super.headers, Authorization: `Bearer ${getAuthToken()}` }
  }
}

window.Turbo.fetchRequestConstructor = AuthFetchRequest
```

All subsequent Turbo requests will include your custom header.