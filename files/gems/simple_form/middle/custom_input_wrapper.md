## 🛠️ Customize Input Wrappers
Simple Form allows you to define and reuse custom wrappers for consistent form layouts. By configuring wrappers in `config/initializers/simple_form.rb`, you can specify how labels, inputs, hints, and errors are rendered across your app.

```ruby
# config/initializers/simple_form.rb
SimpleForm.setup do |config|
  config.wrappers :vertical_with_hint, tag: 'div', class: 'form-group' do |b|
    b.use :label, class: 'form-label'
    b.use :input, class: 'form-control'
    b.use :hint,  wrap_with: { tag: 'small', class: 'form-text text-muted' }
    b.use :error, wrap_with: { tag: 'div', class: 'invalid-feedback' }
  end
end

# Usage in your form
= simple_form_for @user, wrapper: :vertical_with_hint do |f|
  = f.input :email, hint: 'We’ll never share your email.'
```