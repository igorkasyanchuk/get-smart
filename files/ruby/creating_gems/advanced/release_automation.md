## 🔄 Automate Gem Releases with Rake Tasks and Git Tags

Manually bumping versions and releasing gems is error‑prone. You can define Rake tasks that bump your `VERSION`, generate a `CHANGELOG.md` from git commit messages, tag the release, and push both code and gem in one go. This pattern leverages Bundler’s gem tasks and shelling out to Git.

```ruby
# Rakefile
require 'bundler/gem_tasks'
require 'bundler/gem_helper'
Bundler::GemHelper.install_tasks

# Generate changelog from commits since last tag
namespace :changelog do
  desc "Generate CHANGELOG.md from git history"
  task :generate do
    history = `git log $(git describe --tags --abbrev=0)..HEAD --pretty=format:"* %s (%h)"`
    File.write('CHANGELOG.md', "# Changelog\n\n" + history)
  end
end

# Release workflow: build, commit changelog, tag, push, and push gem
namespace :release do
  desc "Build gem, tag, and push to RubyGems"
  task :all => ['changelog:generate', :build] do
    version = MyGem::VERSION
    tag     = "v#{version}"

    sh "git add CHANGELOG.md"
    sh "git commit -m 'Release #{tag}'"
    sh "git tag #{tag}"
    sh "git push origin --tags"
    sh "gem push pkg/mygem-#{version}.gem"
  end
end

# Default to full release
task default: 'release:all'
```
