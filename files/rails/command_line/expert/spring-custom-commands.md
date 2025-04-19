## 🚀 Supercharge Rails Commands with Spring Custom Commands

Leverage Spring’s preloader to create custom commands that run against a warm application context. This drastically reduces startup overhead for repetitive tasks in development.

1. Register your custom Spring command in `config/spring.rb`:

```ruby
# config/spring.rb
require 'spring/command'
Spring.register_command(:stats) do |env, *args|
  # Preloaded Rails environment is available
  Rails.application.eager_load!
  puts "Model counts:"
  ApplicationRecord.descendants.each do |model|
    puts "  #{model.name}: #{model.count}"
  end
end
``` 

2. Create a shim in `bin/rails-stats` to invoke Spring:

```bash
#!/usr/bin/env spring
<%# bin/rails-stats %>
require 'spring/commands'
Spring::Command::Stats.new(ARGV).call
``` 

3. Make it executable and run:

```bash
chmod +x bin/rails-stats
bin/rails-stats
```

You now have a sub-second custom task that introspects your live app without cold boots.