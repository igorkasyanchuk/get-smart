## 🛠️ Creating a Stimulus Controller

Stimulus controllers live in `app/javascript/controllers`. Generate one manually or via Rails generator. Controllers encapsulate behavior for specific elements.

```bash
# Generate a controller named hello
rails generate stimulus hello
```

This creates `hello_controller.js` with a basic structure including `connect()` and `disconnect()` methods.