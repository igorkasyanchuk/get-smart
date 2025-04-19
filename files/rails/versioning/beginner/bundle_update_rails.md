## ⬆️ Update Rails with Bundler

Keeping Rails up to date with minor or patch releases is simple with Bundler. Use `bundle update rails` to upgrade Rails to the latest allowed version as specified by your Gemfile, without touching other gems.

```bash
# Updates only the rails gem according to Gemfile constraints
bundle update rails
```

If you want to see which gems have newer versions before updating, run:

```bash
bundle outdated
```
