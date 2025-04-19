## ⚡️ Lazy-Load Turbo Frames

You can lazy-load Turbo Frames by swapping in the frame's src attribute when it enters the viewport. This technique defers loading heavy content until needed, improving initial page load speed. Use the Intersection Observer API to detect visibility and update the frame src dynamically.

```javascript
document.addEventListener('turbo:load', () => {
  const frames = document.querySelectorAll('turbo-frame[data-src]');
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const frame = entry.target;
        frame.src = frame.dataset.src;
        observer.unobserve(frame);
      }
    });
  });

  frames.forEach(frame => observer.observe(frame));
});
```
