## ⚡ Handle Multiple Blocks via `Proc` Parameters

Ruby doesn’t support two `&` parameters directly, but you can accept extra `Proc` objects explicitly. This is handy for hooks or callbacks in your APIs. Name them clearly to indicate their purpose.

```ruby
def with_hooks(main_proc, before_hook = nil, after_hook = nil)
  before_hook.call if before_hook
  result = main_proc.call
  after_hook.call if after_hook
  result
end

main = proc { puts 'Main action'; 42 }
before = proc { puts 'Setup' }
after = proc { puts 'Cleanup' }

value = with_hooks(main, before, after)
# Setup
# Main action
# Cleanup
# => 42
```