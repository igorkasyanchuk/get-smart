## 🌀 Dynamic Dispatch with Method Objects
Storing method objects in collections enables dynamic dispatch and decoupling. You can queue or filter operations as first‑class entities rather than stringly‑typed method names.

```ruby
class TaskRunner
  def initialize(tasks = [])
    @tasks = tasks.map { |obj, meth| obj.method(meth) }
  end

  def run_all(*args)
    @tasks.each { |m| m.call(*args) }
  end
end

runner = TaskRunner.new([[Logger.new, :info], [Notifier.new, :send_email]])
runner.run_all('Hello')
```