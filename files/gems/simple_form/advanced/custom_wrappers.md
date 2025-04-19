## ⚙️ Customize Input Wrappers for Unique Markup

By defining custom wrappers in your SimpleForm initializer, you can enforce consistent markup, CSS classes, and JavaScript hooks across your app. Wrappers let you control how labels, inputs, hints, and errors are arranged and rendered. This is especially useful when integrating with custom UI frameworks or implementing design systems.

```ruby
# config/initializers/simple_form.rb
SimpleForm.setup do |config|
  config.wrappers :fancy, tag: 'div', class: 'fancy-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.use :label, wrap_with: { tag: 'span', class: 'fancy-label' }
    b.wrapper tag: 'div', class: 'fancy-input-wrapper' do |ba|
      ba.use :input, class: 'fancy-input'
      ba.use :error, wrap_with: { tag: 'small', class: 'error-text' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'hint-text' }
    end
  end

  config.default_wrapper = :fancy
end
```