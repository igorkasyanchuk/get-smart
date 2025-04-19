## ⚙️ Initialize Gem Skeleton with Bundler

Bundler provides a built‑in generator to scaffold a new gem complete with Rake tasks, a gemspec, and testing framework. This saves you time and ensures you're following best practices from the start. Run:

```bash
bundle gem my_cool_gem --test=rspec
```

This will create:

- A `my_cool_gem.gemspec` file with stubbed metadata.
- A `lib/my_cool_gem.rb` entry point and `lib/my_cool_gem/version.rb`.
- Rake tasks for building, releasing, and running specs.

You can immediately run `rake spec` to verify the setup.