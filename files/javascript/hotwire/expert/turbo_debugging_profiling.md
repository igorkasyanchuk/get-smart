## 🐞 Debug Turbo Pipelines with Performance Tracing

Instrument Turbo events and measure durations between `turbo:before-fetch-request` and `turbo:frame-render` to identify bottlenecks. Log timing data to your monitoring service.

```js
const timings = {};

document.addEventListener("turbo:before-fetch-request", () => {
  timings.start = performance.now();
});

document.addEventListener("turbo:frame-render", () => {
  const elapsed = performance.now() - timings.start;
  console.log(`Turbo frame render took ${elapsed.toFixed(2)}ms`);
  // send to external monitoring
});
```