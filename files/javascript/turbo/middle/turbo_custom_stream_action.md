## 🛠 Register Custom Turbo Stream Actions

Extend Turbo by creating custom stream actions using `Turbo.StreamActions.register`. Define new actions to handle specialized DOM updates from `<turbo-stream>` tags.

```javascript
Turbo.StreamActions.register('highlight', (target, content) => {
  target.classList.add('highlighted');
  target.innerHTML = content;
});
```

Use it in your Rails views:

```erb
<turbo-stream action="highlight" target="post_123">
  <template>Updated content</template>
</turbo-stream>
```
