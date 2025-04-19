## 📤 Advanced File Upload Progress with Direct Uploads and Turbo Frames

Combine Active Storage Direct Uploads with Stimulus to reflect real‑time progress inside a Turbo Frame. Listen to upload events and stream progress bars without full page refresh.

```js
import { Controller } from "@hotwired/stimulus";
import { DirectUpload } from "@rails/activestorage";

export default class extends Controller {
  static targets = ["input", "progress"];

  connect() {
    this.inputTarget.addEventListener("direct-upload:initialize", (e) => {
      this.progressTarget.value = 0;
    });

    this.inputTarget.addEventListener("direct-upload:progress", (e) => {
      this.progressTarget.value = e.detail.progress;
    });

    this.inputTarget.addEventListener("direct-upload:end", () => {
      this.progressTarget.value = 100;
    });
  }

  upload() {
    new DirectUpload(this.inputTarget.files[0], this.data.get("url"), this).create((error, blob) => {
      if (!error) {
        const hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("value", blob.signed_id);
        this.element.appendChild(hiddenField);
        this.element.requestSubmit();
      }
    });
  }
}
```