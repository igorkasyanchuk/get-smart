## 🐞 Manually Trigger turbo:load
If you inject HTML dynamically, dispatch `turbo:load` so Turbo assets reinitialize.

```js
const newContent = document.createElement("div");
newContent.innerHTML = "<turbo-frame id='f'>Hello</turbo-frame>";
document.body.appendChild(newContent);

window.dispatchEvent(new Event("turbo:load"));
```