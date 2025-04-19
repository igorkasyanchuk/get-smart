## 📝 Intercept Form Submissions

Turbo automatically handles form submissions, but you can intercept them to add custom behavior or validations. Listen for the `turbo:submit-start` event and call `event.preventDefault()` when needed to override the default action.

```javascript
document.addEventListener('turbo:submit-start', event => {
  const form = event.target;
  if (!form.checkValidity()) {
    event.preventDefault();
    alert('Please fill out all required fields.');
  }
});
```
