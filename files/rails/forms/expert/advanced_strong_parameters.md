## 🚀 Advanced Strong Parameters with Conditional and Dynamic Attributes
Handle dynamic nested parameters when you need to permit attributes based on runtime conditions. Use `permit` with splat operators and conditional logic to tighten security while supporting flexible forms.

```ruby
# In ProjectsController
def project_params
  permitted = [:name, :deadline]
  permitted << { tasks_attributes: [:id, :title, :_destroy] } if current_user.admin?
  permitted << :priority if params[:project][:priority].present?
  params.require(:project).permit(*permitted)
end
```

For deeply nested hashes, transform keys before permitting:

```ruby
# Convert camelCase to snake_case keys
snake = params[:data].to_unsafe_h.deep_transform_keys { |key| key.to_s.underscore }
clean = ActionController::Parameters.new(snake)
clean.require(:project).permit(:name, :status)
```