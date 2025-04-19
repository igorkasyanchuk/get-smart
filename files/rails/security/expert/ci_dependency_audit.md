## 🔍 CI-Driven Dependency Audits (bundler-audit + OWASP)
Discover vulnerable gems and transitive dependencies early by running bundler-audit and OWASP dependency-check in your CI pipeline. Fail builds on known CVEs.

```yaml
# .github/workflows/ci.yml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: 3.1
      - name: Install dependencies
        run: bundle install --jobs 4
      - name: Bundler-Audit Update
        run: bundle exec bundler-audit update
      - name: Bundler-Audit Check
        run: bundle exec bundler-audit check --verbose --update
      - name: OWASP Dependency Check
        run: dependency-check --project RailsApp --scan .
```