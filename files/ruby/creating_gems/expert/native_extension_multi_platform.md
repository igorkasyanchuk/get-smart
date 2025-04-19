## 🧩 Cross-Platform Native Extensions with mkmf and rake-compiler

Building C extensions that work across multiple Ruby versions and OSes requires `mkmf` plus `rake-compiler` or `rake-compiler-dock`. Use `Rake::ExtensionTask` to automate packaging of precompiled binaries in your gem’s `lib` directory. This reduces install failures for users without build toolchains.

```ruby
# ext/my_ext/extconf.rb
require 'mkmf'
create_makefile('my_ext/my_ext')
```

```ruby
# Rakefile
require 'rake/extensiontask'
spec = Gem::Specification.load('my_ext.gemspec')
Rake::ExtensionTask.new('my_ext', spec) do |ext|
  ext.lib_dir = 'lib/my_ext'
end
``` 

```bash
# Build for local platform
rake compile
# Or use Docker images for cross-compiling
rake compile:linux
rake compile:windows
```