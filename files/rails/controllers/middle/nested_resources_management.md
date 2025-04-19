## 📦 Manage Nested Resources
When dealing with nested resources, load parent and child records clearly to avoid confusion. Use nested routes and `before_action` to set parents. This provides context and ensures correct scoping.

```ruby
# config/routes.rb
resources :projects do
  resources :tasks
end

# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @project.tasks
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end
end
```