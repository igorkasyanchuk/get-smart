## ⚙️ Creating Custom Rails CLI Commands with Railties

Extend Rails’ command-line interface by defining your own commands via a Railtie. This approach lets you ship reusable, versioned commands in gems or engines and hook into Rails’ boot process.

1. Create a gem (e.g. `rails-cli-ext`) and add a Railtie:

```ruby
# lib/rails_cli_ext/railtie.rb
require 'rails'
module RailsCliExt
  class Railtie < Rails::Railtie
    railtie_name :rails_cli_ext

    # Register a new command: bin/rails hello_world
    rake_tasks do
      require_relative 'commands/hello_world'
      Rails::Command::Registry.register(:hello_world, Rails::Command::HelloWorldCommand)
    end
  end
end
```

2. Define the command behavior:

```ruby
# lib/rails_cli_ext/commands/hello_world.rb
require 'rails/command'
module Rails::Command
  class HelloWorldCommand < Base
    def perform
      say "👋 Hello, Rails CLI expert!"
    end
  end
end
```

3. Install your gem and run:

```bash
gem install rails-cli-ext
bin/rails hello_world
```