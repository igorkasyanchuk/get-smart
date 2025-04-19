## 🚀 Implementing Resumable Direct Uploads with S3 Multipart

For multi‑GB files, enable S3’s multipart upload and hook into Active Storage’s JS events to show resumable progress and retry segments on failure.

1. Configure multipart in `config/storage.yml`:

```yaml
amazon:
  service: S3
  multipart: true
  bucket: <%= ENV['S3_BUCKET'] %>
  upload: :multipart
```

2. Add JavaScript listeners (e.g., `app/javascript/packs/active_storage_uploads.js`):

```javascript
import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()

document.addEventListener("direct-upload:initialize", event => {
  const { id, file } = event.detail
  console.log(`Starting upload ${id} for ${file.name}`)
})

document.addEventListener("direct-upload:progress", event => {
  const { id, progress } = event.detail
  document.querySelector(`#upload-${id} .progress`).style.width = `${progress}%`
})

document.addEventListener("direct-upload:error", event => {
  console.error("Upload failed:", event.detail.error)
  // Retry logic or user prompt
})
```