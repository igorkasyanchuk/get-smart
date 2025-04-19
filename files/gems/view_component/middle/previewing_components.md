## 🔍 Previewing Components in Rails Previews

Rails component previews let you see your component variations in the browser without running the full app. Create a preview class under `test/components/previews` and define methods for each state.

```ruby
# test/components/previews/alert_component_preview.rb
class AlertComponentPreview < ViewComponent::Preview
  def success
    render(AlertComponent.new(type: :success, message: "Operation successful!") )
  end

  def error
    render(AlertComponent.new(type: :error, message: "Something went wrong.") )
  end
end
```

Visit `http://localhost:3000/rails/view_components` to interactively review and test your component behaviors.