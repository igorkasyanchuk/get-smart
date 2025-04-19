## 🔧 Overriding Turbo Form Submission
Intercept and replace Turbo’s form submission to add custom validation or analytics. Cancel the default behavior and manually dispatch.

```javascript
document.addEventListener('turbo:submit-start', (event) => {
  event.preventDefault()
  const form = event.target
  if (!customValidate(form)) return
  fetch(form.action, { method: form.method, body: new FormData(form) })
    .then(response => Turbo.renderStreamMessage(response.text()))
})
```

This allows you to layer in behavior before Turbo processes the form.