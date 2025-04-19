## 🚀 Enqueue a Job from a Controller

To push a job onto the queue, call `perform_async` on the worker class. This is non-blocking and returns immediately, letting your web request finish fast.

```ruby
# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  def create
    name = params[:name]
    HardWorker.perform_async(name, 3)
    render plain: "Job enqueued!"
  end
end
```