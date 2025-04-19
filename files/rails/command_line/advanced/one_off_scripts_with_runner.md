## 🚀 One-Off Scripts with `rails runner`

Use `rails runner` to execute Ruby code in the context of your Rails app without spinning up the console or web server. This is ideal for quick maintenance scripts, data migrations, or cron jobs. You can specify environment, require files, and even profile execution time.

Example: Run a class method in production and log output:

```bash
RAILS_ENV=production bin/rails runner "User.cleanup_inactive" >> log/cleanup.log
```

Example: Execute a standalone script file with access to your app’s models:

```bash
bin/rails runner path/to/scripts/update_stats.rb
```

Example: Profile a code block using the `Benchmark` library:

```bash
bin/rails runner -e development "require 'benchmark'; puts Benchmark.measure { Order.recalculate_monthly }"
```
