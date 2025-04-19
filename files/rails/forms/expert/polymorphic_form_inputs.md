## 🧩 Polymorphic Form Inputs for Multiple Association Types
Construct a single form supporting multiple associated record types by inspecting a type field and rendering conditional inputs. This reduces duplication when embedding comments, tags, or attachments polymorphically.

```erb
<%= unified_form_with model: @attachment do |f| %>
  <%= f.input_field :attachable_type, as: :select, collection: %w[Post Comment], data: { action: 'change->poly#toggle' } %>
  <div data-poly-target="Post">
    <%= f.input_field :attachable_id, as: :select, collection: Post.all.pluck(:title, :id) %>
  </div>
  <div data-poly-target="Comment" hidden>
    <%= f.input_field :attachable_id, as: :select, collection: Comment.all.pluck(:body, :id) %>
  </div>
  <%= f.submit %>
<% end %>
```

```js
// app/javascript/controllers/poly_controller.js
import { Controller } from '@hotwired/stimulus'
export default class extends Controller {
  static targets = ['Post', 'Comment']
  toggle(event) {
    this.PostTarget.hidden = event.target.value !== 'Post'
    this.CommentTarget.hidden = event.target.value !== 'Comment'
  }
}
```