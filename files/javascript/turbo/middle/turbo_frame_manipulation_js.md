## 🔄 Dynamically Update Turbo Frames

Turbo Frames can be targeted and updated on the client by replacing their inner HTML or updating their src attribute. Use `document.getElementById` and assign `innerHTML` to update content without a full page reload, then dispatch a frame load event if necessary.

```javascript
fetch('/posts/1')
  .then(response => response.text())
  .then(html => {
    const frame = document.getElementById('post_frame');
    frame.innerHTML = html;
    Turbo.dispatch('turbo:frame-load', { target: 'post_frame' });
  });
```
