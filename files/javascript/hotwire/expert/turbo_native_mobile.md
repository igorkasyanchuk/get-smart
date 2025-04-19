## 📱 Integrate Turbo Native for Hybrid Mobile Experiences

Use Turbo Native on iOS/Android to bridge your Rails backend with a native shell. Customize webview hooks to handle deep links, custom headers, and offline caching.

```swift
// iOS: AppDelegate.swift
turboSession.webViewConfiguration.applicationNameForUserAgent = "MyApp/1.0"

turboSession.visit(URL(string: "https://example.com/dashboard")!)
```  
```kotlin
// Android: MainActivity.kt
val session = TurboSession.create(this, view)
session.webView.webViewClient = object : TurboWebViewClient(session) {
  override fun shouldOverrideUrlLoading(
    view: WebView, request: WebResourceRequest
  ): Boolean {
    if (request.url.host == "example.com") return false
    // handle external links
    return true
  }
}
session.loadUrl("https://example.com/dashboard")
```