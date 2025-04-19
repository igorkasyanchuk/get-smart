## 🛠️ Prepending Custom Hooks with Modules

Inject global behavior into all example groups by prepending hook modules into RSpec’s hook system. This technique allows you to implement cross-cutting concerns (e.g., DB sandboxing, logging) without modifying individual specs. Use `prepend_before` and `prepend_after` within a module, and include that module via `config.extend` or `config.include`.

```ruby
module SandboxHooks
  def self.prepended(base)
    base.prepend_before(:context) do
      DB.start_sandbox
      RSpec.configuration.reporter.message '🔐 Sandbox started'
    end
    base.prepend_after(:context) do
      DB.rollback_sandbox
      RSpec.configuration.reporter.message '🔓 Sandbox rolled back'
    end
  end
end

RSpec.configure do |config|
  config.extend SandboxHooks
end

RSpec.describe User, type: :model do
  # before any tests in this group, sandbox is started
  # after group runs, sandbox is rolled back
end
```

By prepending, you ensure your hooks run before any other `before(:context)` logic, giving you full control over setup and teardown order.