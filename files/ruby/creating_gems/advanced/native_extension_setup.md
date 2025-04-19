## 🛠️ Integrate Native Extensions Using rake‑compiler

To ship C extensions cross‑platform, use the `rake‑compiler` gem. It generates Makefiles, compiles your extension, and packages platform‑specific gems automatically. This ensures users on Windows, macOS, and Linux get precompiled binaries.

```ruby
# ext/mygem/extconf.rb
require 'mkmf'
create_makefile('mygem_native')
```

```ruby
# Rakefile
require 'rake/extensiontask'
require 'bundler/gem_tasks'

Rake::ExtensionTask.new('mygem_native') do |ext|
  ext.lib_dir       = 'lib/mygem'
  ext.ext_dir       = 'ext/mygem'
  ext.source_pattern = 'ext/mygem/**/*.{c,h}'
end

task default: :compile
```

```ruby
# mygem.gemspec
Gem::Specification.new do |spec|
  # ...
  spec.extensions = ['ext/mygem/extconf.rb']
  spec.platform   = Gem::Platform::RUBY
end
```

Run `rake compile` to build locally, or `rake cross` to build for multiple platforms (requires Docker).