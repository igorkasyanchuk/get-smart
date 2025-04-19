## ❄️ Freezing Turbo Frames for Modals
Lock a Turbo Frame’s inner content while showing a modal to avoid background updates. Use CSS classes toggled via JS.

```javascript
function showModal() {
  const frame = document.querySelector('turbo-frame#chat')
  frame.classList.add('frozen')
  // launch modal...
}

.css:
.frozen { pointer-events: none; opacity: 0.6; }
```

After closing, remove `.frozen` to resume live updates.