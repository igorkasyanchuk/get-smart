## 🏷️ Manage Versioning and Metadata

Keep your gem’s version in `lib/<gem_name>/version.rb` and reference it in the gemspec so you only update it in one place. For example:

```ruby
# lib/my_cool_gem/version.rb
module MyCoolGem
  VERSION = "0.1.0"
end
```

```ruby
# my_cool_gem.gemspec
Gem::Specification.new do |spec|
  spec.name        = "my_cool_gem"
  spec.version     = MyCoolGem::VERSION
  spec.authors     = ["Your Name"]
  spec.summary     = "Short summary of functionality"
  spec.files       = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
end
```

To bump the version, update `VERSION` and run `rake build`/`rake release` to automate tagging and pushing.