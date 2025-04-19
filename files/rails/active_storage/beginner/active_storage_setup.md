## ⚙️ Setting Up Active Storage

To start using Active Storage, run the installer which creates necessary tables and configuration. This sets up `ActiveStorage::Blob` and `ActiveStorage::Attachment` models for file uploads.

```bash
# Run the installer and migrate the database
bin/rails active_storage:install
bin/rails db:migrate
```