## ⛔️ Abort Ongoing Navigation

Sometimes you need to cancel a navigation mid-flight, for example if unsaved changes exist. Listen for `turbo:before-visit` and call `event.preventDefault()` to stop Turbo from proceeding until the user confirms.

```javascript
let hasUnsavedChanges = false;

// set this flag in your form change handlers

document.addEventListener('turbo:before-visit', event => {
  if (hasUnsavedChanges && !confirm('Leave without saving?')) {
    event.preventDefault();
  }
});
```
