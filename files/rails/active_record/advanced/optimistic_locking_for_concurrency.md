## ⏱ Optimistic Locking for Concurrency

Prevent race conditions on high‑traffic records by enabling optimistic locking. Rails auto‑increments a `lock_version` column on each update.

```ruby
class Document < ApplicationRecord; end
# Migration: add_column :documents, :lock_version, :integer, default: 0, null: false

doc = Document.find(1)
doc.update!(title: "New Title")

# If two processes load and save the same record, ActiveRecord::StaleObjectError is raised on conflict.
```