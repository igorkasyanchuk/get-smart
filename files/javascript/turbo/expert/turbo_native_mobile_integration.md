## 📱 Integrating Turbo JS with Native Mobile Wrappers
Supercharge hybrid apps by embedding Turbo JS inside native WebViews and bridging native features. Use custom URL schemes to bridge navigation and actions between Turbo frames and native code.

```js
// In your WebView setup (iOS example)
webView.configuration.userContentController.add(
  self, name: "nativeBridge"
);
```

```js
// app/javascript/native_bridge.js
window.nativeBridge = {
  postMessage: data => window.webkit.messageHandlers.nativeBridge.postMessage(data)
}

// Use in your view
<a href="#" onclick="nativeBridge.postMessage('openCamera')">Open Camera</a>
```