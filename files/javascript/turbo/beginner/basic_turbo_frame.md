## 🔄 Basic Turbo Frame Usage
Turbo Frames let you target specific areas to update. Wrap content in `<turbo-frame>` and link to a full page—the frame will extract and replace only its content.

```html
<turbo-frame id="posts_frame">
  Loading posts...
</turbo-frame>

<a href="/posts" data-turbo-frame="posts_frame">Load Posts in Frame</a>
```