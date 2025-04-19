## 📦 Real-Time Validations with Stimulus and Custom Endpoints
Provide instant feedback by calling a validation endpoint from a Stimulus controller on input events. Render JSON errors and update the form inline without blocking typing.

```js
// app/javascript/controllers/validation_controller.js
import { Controller } from '@hotwired/stimulus'
export default class extends Controller {
  static targets = ['input', 'feedback']
  validate() {
    fetch(`/users/validate?field=${this.inputTarget.name}&value=${this.inputTarget.value}`)
      .then(res => res.json())
      .then(data => {
        this.feedbackTarget.textContent = data.error || ''
        this.inputTarget.classList.toggle('is-invalid', !!data.error)
      })
  }
}
```

```erb
<%= form_with model: @user, html: { data: { controller: 'validation' } } do |f| %>
  <%= f.input_field :username, data: { action: 'input->validation#validate', validation_target: 'input' } %>
  <div data-validation-target="feedback" class="invalid-feedback"></div>
<% end %>
```