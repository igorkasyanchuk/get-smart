## 🌐 Integrating Turbo with React Components
Mount React components inside Turbo Frames seamlessly by listening to `turbo:frame-load`. This pattern lets you progressively enhance server-rendered HTML with React’s interactivity.

```javascript
// app/javascript/packs/turbo_react.js
import React from 'react'
import ReactDOM from 'react-dom'
import CommentWidget from './components/CommentWidget'

document.addEventListener('turbo:frame-load', event => {
  const node = event.target.querySelector('[data-react-root]')
  if (node) {
    ReactDOM.render(
      <CommentWidget id={node.dataset.threadId} />, node
    )
  }
})
```
