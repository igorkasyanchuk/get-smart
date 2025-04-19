## 🛠️ Custom Bundler Gem Templates

When creating internal gems at scale, override Bundler’s default scaffold to enforce your organization’s conventions. Place your ERB templates under `~/.bundle/templates` so every new gem inherits your license, CI config, and code style. This approach ensures consistency across versions without manual edits.

```bash
# Configure Bundler to use your custom templates
bundle config set gem.templates '~/.bundle/templates'

# Example: create a new gem using your templates
bundle gem my_awesome_gem
```

```erb
# ~/.bundle/templates/newgem.gemspec.tt
Gem::Specification.new do |spec|
  spec.name          = "<%= gem_name %>"
  spec.version       = "0.1.0"
  spec.license       = "MIT"
  spec.metadata      = { "homepage_uri" => "https://github.com/your_org/<%= gem_name %>" }
  # Add your custom CI badges or tooling here
end
```