## 🔎 Monitor Navigation Lifecycle

Gain insight into Turbo's navigation process by listening to lifecycle events like `turbo:visit`, `turbo:before-render`, and `turbo:load`. This allows custom analytics tracking or UI state management around page transitions.

```javascript
document.addEventListener('turbo:visit', event => {
  console.log('Visiting', event.detail.url);
});

document.addEventListener('turbo:load', () => {
  console.log('Page fully loaded by Turbo');
});
```
