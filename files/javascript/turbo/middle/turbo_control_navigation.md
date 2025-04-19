## 🚫 Control Automatic Navigation

You can prevent Turbo from following links or form submissions by disabling the drive feature on specific elements. Add the `data-turbo="false"` attribute or listen for `turbo:before-visit` to conditionally override Turbo's behavior.

```html
<!-- Disable Turbo on a link -->
<a href="/external" data-turbo="false">Go to External Site</a>
```

```javascript
document.addEventListener('turbo:before-visit', event => {
  if (event.detail.url.includes('/admin')) {
    event.preventDefault();
    window.location = event.detail.url;
  }
});
```
