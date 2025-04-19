## 📤 Streaming File Upload Progress with Turbo Streams
Implement real-time upload progress by chunking file uploads and sending Turbo Streams back to the client. Use a custom ActionCable channel for progress events.

```js
// app/javascript/controllers/upload_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  async upload(event) {
    const file = event.target.files[0];
    const channel = this.application.consumer.subscriptions.create(
      { channel: "UploadChannel", file_id: file.name },
      {
        received: data => Turbo.renderStreamMessage(data)
      }
    );

    const chunkSize = 64 * 1024;
    for (let offset = 0; offset < file.size; offset += chunkSize) {
      const chunk = file.slice(offset, offset + chunkSize);
      await fetch(this.data.get("url"), { method: "POST", body: chunk });
    }
  }
}
```

```erb
<input type="file" data-controller="upload" data-upload-url="/uploads" />
```