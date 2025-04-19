## ⚙️ Implementing Callbacks in Mixins

Create callback hooks inside modules so including classes can register methods to run at specific points. This pattern is common in ORMs and event-driven architectures.

```ruby
module Callbacks
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def before(action, method)
      @callbacks ||= {}
      @callbacks[action] ||= []
      @callbacks[action] << method
    end

    def run_callbacks(action, *args)
      (@callbacks[action] || []).each { |m| send(m, *args) }
    end
  end

  def run(action)
    self.class.run_callbacks(action, self)
  end
end

class Job
  include Callbacks
  before :run, :setup

  def setup(job)
    puts "Setup \\#{job.class}"
  end
end
```