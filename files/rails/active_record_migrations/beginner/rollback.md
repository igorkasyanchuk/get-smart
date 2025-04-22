## ⏪ Roll Back Your Last Migration

When a migration causes issues, undo it with `rails db:rollback`. You can specify `STEP` to revert multiple migrations at once.

```bash
# Roll back the last migration
rails db:rollback

# Roll back the last 2 migrations
rails db:rollback STEP=2
```
