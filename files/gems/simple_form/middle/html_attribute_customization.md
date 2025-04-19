## 🎨 Customize HTML Attributes on Inputs
Tailor your form inputs for styling or JavaScript hooks by passing `input_html` and `wrapper_html` options. This approach keeps your view code DRY while adding custom classes, data attributes, or ARIA options.

```ruby
= simple_form_for @account do |f|
  = f.input :username,
            placeholder: 'Your username',
            input_html: {
              class: 'username-field',
              data: { toggle: 'tooltip', placement: 'right' },
              aria: { describedby: 'usernameHelp' }
            },
            wrapper_html: { class: 'username-wrapper mb-4' }

  = f.input :password,
            as: :password,
            input_html: { autocomplete: 'new-password', minlength: 8 }
```