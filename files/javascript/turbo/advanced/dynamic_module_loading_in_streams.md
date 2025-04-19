## 📦 Dynamic Module Loading in Turbo Streams
Dynamically import JavaScript modules when specific Turbo Streams arrive to reduce bundle size. Utilize the `turbo:before-stream-render` event to conditionally load code only when required.

```javascript
// app/javascript/stream_handlers/chart_loader.js
export async function handleChartStream(event) {
  const { default: Chart } = await import('chart.js')
  const data = JSON.parse(event.target.templateElement.textContent)
  new Chart(document.getElementById(data.id), data.config)
}

document.addEventListener('turbo:before-stream-render', event => {
  if (event.target.action === 'update-chart') {
    handleChartStream(event)
    event.preventDefault()
  }
})
```
