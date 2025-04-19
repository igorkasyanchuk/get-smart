## 🎛️ Advanced Error Handling in Turbo Streams
Centralize error alerts for all Turbo Frame and Stream failures by listening to global events. You can show a unified toast or rollback optimistic UI changes based on response codes.

```javascript
// app/javascript/error_handler.js
function showError(message) {
  // Implement your toast or modal here
  alert(`Error: ${message}`)
}

document.addEventListener('turbo:submit-end', event => {
  const { success, fetchResponse } = event.detail
  if (!success) {
    fetchResponse.text().then(body => showError(body))
  }
})

document.addEventListener('turbo:before-stream-render', event => {
  if (event.target.getAttribute('action') === 'error') {
    showError(event.target.templateElement.textContent)
    event.preventDefault()
  }
})
```
