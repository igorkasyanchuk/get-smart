## 🔗 Prefetching Links with Turbo
Use `<link rel="prefetch">` in combination with Turbo to warm caches for anticipated navigation targets. This lightweight hint primes the next page before the user clicks, improving perceived responsiveness.

```html
<head>
  <!-- Prefetch the about page document for faster Turbo navigation -->
  <link rel="prefetch" href="/about" as="document">
</head>
<!-- Regular Turbo link to about -->
<a href="/about" data-turbo-frame="main">About Us</a>
```
