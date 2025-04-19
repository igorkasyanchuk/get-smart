## ⚡ Dynamic Turbo Frame Source
You can dynamically change the `src` attribute of a Turbo Frame using JavaScript for on‑the‑fly content loading. This is useful for tabs or dropdowns where you want to lazy‑load remote content only when needed.

```javascript
// Assuming <turbo-frame id="profile-frame"></turbo-frame>
document.getElementById('profile-frame').src = '/users/123/profile';
```

When the `src` is set, Turbo automatically issues a GET request and replaces the frame’s content upon response.
