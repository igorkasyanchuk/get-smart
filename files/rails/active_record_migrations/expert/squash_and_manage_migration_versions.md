## 🔥 Squash Migrations and Manage Versioning

Over time, a flurry of small migrations can slow down `rails db:schema:load`. Periodically squash them into one file and adjust the version to keep history clean:

```bash
rails db:environment:set RAILS_ENV=production
rails db:schema:dump
mv db/schema.rb db/structure.sql # if using structure
rails db:drop db:create
rails db:schema:load
rails db:migrate:status
```

Create a new `0001_squashed_migrations.rb` that reflates the current schema and retire old files. Keep a git tag pointing to the last squashed migration for reference.