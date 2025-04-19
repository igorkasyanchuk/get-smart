## 🤖 Automating Releases with GitHub Actions and Bundler Gem Tasks

Implement a CI pipeline that tags, builds, signs, and pushes gems automatically on `v*` tags. Combine `bundler/gem_tasks` with a minimal GitHub Actions workflow to ensure atomic releases, CHANGELOG updates, and GPG signing for integrity.

```yaml
# .github/workflows/release.yml
name: Release Gem
on:
  push:
    tags:
      - 'v*'
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.x'
      - run: gem install bundler
      - run: bundle install
      - run: bundle exec rake build
      - run: |
          GPG_KEY=$(echo "$GPG_PRIVATE_KEY" | base64 -d)
          echo "$GPG_KEY" | gpg --import
          gem push pkg/*.gem --key MyKey
        env:
          GPG_PRIVATE_KEY: ${{ secrets.GPG_PRIVATE_KEY }}
      - run: bundle exec rake changelog:release
        # Assumes you have a Rake task to append release notes
```