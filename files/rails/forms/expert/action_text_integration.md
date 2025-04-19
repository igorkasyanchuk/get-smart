## 🎨 Integrating Action Text and Active Storage in Forms
Leverage `form.rich_text_area` to include Trix editors with direct file uploads through Active Storage. Configure storage service for direct uploads, enabling drag-and-drop attachments in your form.

```ruby
# app/views/articles/_form.html.erb
<%= unified_form_with model: @article do |f| %>
  <%= f.input_field :title %>
  <%= f.rich_text_area :content %>
  <%= f.submit %>
<% end %>
```

```js
// app/javascript/controllers/direct_uploads_controller.js
import { Controller } from '@hotwired/stimulus'
import * as DirectUpload from '@rails/activestorage'
export default class extends Controller {
  connect() {
    this.element.querySelectorAll('input[type=file]').forEach(input => {
      new DirectUpload(input, this.directUploadUrl()).start()
    })
  }
  directUploadUrl() {
    return '/rails/active_storage/direct_uploads'
  }
}
```