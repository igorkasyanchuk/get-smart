## 📱 Integrating Turbo Native for Hybrid Apps
Use Turbo Native to power your iOS/Android hybrid apps with your Rails back end. Customize the native view controller lifecycle hooks in JavaScript.

```javascript
document.addEventListener('turbo:visit', (event) => {
  NativeBridge.postMessage('visitStarted', {url: event.detail.url})
})

document.addEventListener('turbo:load', () => {
  NativeBridge.postMessage('pageLoaded')
})
```

This lets the native layer display loading indicators or manage navigation stacks.