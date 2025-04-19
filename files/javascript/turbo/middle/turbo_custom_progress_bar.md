## 🎨 Customize Turbo Progress Bar

Turbo shows a default progress bar during navigation, but you can replace or style it by listening to `turbo:download-start` and `turbo:download-end` events. Use these hooks to control visibility of a custom progress indicator.

```javascript
document.addEventListener('turbo:download-start', () => {
  document.getElementById('custom-progress').classList.add('active');
});

document.addEventListener('turbo:download-end', () => {
  document.getElementById('custom-progress').classList.remove('active');
});
```
