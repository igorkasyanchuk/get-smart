## 🔄 IRB Workspace Context Switching
Switch between multiple bindings (contexts) on the fly, letting you inspect different scopes without leaving IRB.

```ruby
require 'irb'

@ctx1 = binding
@foo = 42

@ctx2 = TOPLEVEL_BINDING

def switch_to(ctx)
  IRB.start_within(ctx)
end

# In IRB:
switch_to(@ctx1)  # Now sees @foo
switch_to(@ctx2)  # Back to top-level
```

Use `IRB.start_within(binding)` to reopen a REPL in any binding, enabling seamless context hops.