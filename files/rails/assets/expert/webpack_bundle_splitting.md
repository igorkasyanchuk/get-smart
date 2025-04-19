## 🗂 Advanced Webpacker Code Splitting and Prefetching

Leverage Webpack's dynamic `import()` with magic comments to create split bundles and prefetch critical chunks. This defers non-essential JavaScript, speeding up the initial page load and improving performance.

```javascript
// app/javascript/packs/application.js
// Dynamically load and prefetch the admin bundle
const loadAdmin = () =>
  import(/* webpackChunkName: "admin", webpackPrefetch: true */ '../admin')
    .then(module => module.initAdmin())
    .catch(err => console.error('Failed to load admin bundle', err));

document.getElementById('admin-btn').addEventListener('click', loadAdmin);
```

```javascript
// config/webpack/production.js
const { environment } = require('@rails/webpacker');
environment.splitChunks((config) => Object.assign({}, config, {
  optimization: {
    splitChunks: {
      chunks: 'all',
      maxInitialRequests: 10,
      minSize: 20000
    }
  }
}));
module.exports = environment;
```