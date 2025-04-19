## ⏳ Creating a Global Turbo Navigation Progress Bar
Show a progress bar on every Turbo visit to enhance UX. Listen to Turbo events and manipulate a shared bar element.

```javascript
const progressBar = document.getElementById('progress')
document.addEventListener('turbo:visit', () => { progressBar.style.width = '0%'; progressBar.classList.add('active') })
document.addEventListener('turbo:request-start', () => { progressBar.style.width = '50%'; })
document.addEventListener('turbo:load', () => { progressBar.style.width = '100%'; setTimeout(()=>progressBar.classList.remove('active'),300) })
```

Include `<div id="progress" class="progress-bar"></div>` in your layout and style accordingly.