## 📊 Show a Progress Indicator
Use Turbo events to show upload progress. Listen to `turbo:upload-progress` and update a progress bar in your UI.

```html
<progress id="upload_progress" max="100" value="0"></progress>

<script>
  document.addEventListener("turbo:upload-progress", (e) => {
    const percent = e.detail.progress | 0;
    document.getElementById("upload_progress").value = percent;
  });
</script>
```