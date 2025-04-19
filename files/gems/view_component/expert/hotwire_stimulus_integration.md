## 🚀 Integrating Hotwire & Stimulus in ViewComponent
For seamless Turbo Streams and Stimulus controllers within components, use the `tag` helper to mount controllers and dispatch custom events. This approach encapsulates JS behavior inside the component without polluting global scripts.

```ruby
# app/components/comment_form_component.rb
class CommentFormComponent < ViewComponent::Base
  def initialize(post:) = @post = post

  def call
    tag.form data: { controller: "comment-form", action: "ajax:success->comment-form#reset" },
             action: post_comments_path(@post), method: :post, remote: true do
      tag.text_area :body, class: "form-control"
      tag.button "Submit", type: :submit, class: "btn btn-primary"
    end
  end
end
```

```js
// app/javascript/controllers/comment_form_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  reset() {
    this.element.reset()
  }
}
```