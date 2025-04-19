## 🧩 Advanced Signature Handling for Blocks and Keywords
Ensure `method_missing` can accept positional, keyword, and block arguments seamlessly. Use Ruby’s parameter decomposition to avoid losing invocation context when delegating or dynamically handling calls.

```ruby
class SignatureAware
  def method_missing(name, *args, **kwargs, &block)
    if name.to_s.start_with?('run_')
      action = name.to_s.sub('run_', '')
      execute(action, *args, **kwargs, &block)
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?('run_') || super
  end

  private

  def execute(action, *args, **kwargs, &block)
    puts "Executing \\#{action} with args=#{args.inspect}, kwargs=#{kwargs.inspect}"
    block&.call
  end
end

obj = SignatureAware.new
obj.run_task(1, 2, mode: :fast) { puts 'done' }
# => Executing task with args=[1,2], kwargs={:mode=>:fast}
# => done
```