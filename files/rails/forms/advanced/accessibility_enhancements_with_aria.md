## ♿ Accessibility Enhancements with ARIA

Improve form accessibility by adding ARIA attributes, roles, and proper labeling. Use `aria-describedby` for hint texts, `aria-required` for required fields, and group related inputs with `fieldset` and `legend`.

```erb
<fieldset>
  <legend>Contact Information</legend>
  <div class="form-group">
    <%= f.label :email, 'Email Address' %>
    <%= f.email_field :email, aria: { required: true, describedby: 'email_hint' }, class: 'form-control' %>
    <small id="email_hint" class="form-text text-muted">We’ll only use this to contact you.</small>
  </div>
</fieldset>
```