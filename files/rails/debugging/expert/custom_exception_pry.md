## 🚨 Custom Exception Hook into Pry

By default Rails renders a debug page on exceptions. Override the exception app to drop into a pry session whenever an unhandled error occurs, giving you full request context on-demand.

```ruby
# config/initializers/exception_pry.rb
if Rails.env.development?
  require 'pry-rails'
  module PryExceptionHook
    def render_exception(env, exception)
      Rails.logger.error("Exception intercepted: #{exception.class} - #{exception.message}")
      require 'pry'; binding.pry
      super
    end
  end

  ActionDispatch::DebugExceptions.prepend(PryExceptionHook)
end
```

Now when an exception bubbles up, your server console will drop into a pry session with access to `env`, `exception`, and all local frames. Inspect params, session data, or even replay parts of the request programmatically.