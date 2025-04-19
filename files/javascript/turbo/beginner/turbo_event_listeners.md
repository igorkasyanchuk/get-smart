## 🎉 Common Turbo Event Listeners
Turbo emits many events in its lifecycle. Use them to hook rendering, loading, and completion.

```js
["turbo:click", "turbo:load", "turbo:render"].forEach((name) => {
  document.addEventListener(name, () => {
    console.log(`${name} fired!`);
  });
});
```