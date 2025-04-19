## 🧩 Design CLI Gems with Thor and Plugin Discovery

Build a flexible CLI gem using Thor and let third‑party gems register subcommands by following a naming convention. This turns your tool into a plugin host where additional features live in separate gems.

```ruby
# bin/mygem
#!/usr/bin/env ruby
require 'mygem/cli'
MyGem::CLI.start(ARGV)
```

```ruby
# lib/mygem/cli.rb
require 'thor'
module MyGem
  class CLI < Thor
    # Dynamically require any gems named mygem-plugin-*
    Gem.find_files('mygem-plugin-*/lib/**/*.rb').each { |f| require f }

    desc "hello NAME", "Prints a greeting"
    def hello(name)
      puts "Hello, #{name}!"
    end
  end
end
```

Now any gem named `mygem-plugin-xyz` can extend your CLI:

```ruby
# lib/mygem/plugin/fancy.rb (in mygem-plugin-fancy gem)
MyGem::CLI.class_eval do
  desc "fancy", "Run the fancy plugin"
  def fancy
    puts "✨ Fancy plugin activated!"
  end
end
```

Install `mygem-plugin-fancy` alongside your CLI gem, and `bin/mygem fancy` will be available automatically.