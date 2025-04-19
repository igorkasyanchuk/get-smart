## 🚀 Generate the User Model
Use Devise’s generator to create a `User` model equipped with common authentication fields (email, encrypted password, etc.). Running this will also generate a migration that you can review and tweak before migrating your database.

```bash
rails generate devise User
rails db:migrate
```

After migrating, you’ll have a `User` model with Devise modules enabled. You can customize which modules (e.g., `:confirmable`, `:lockable`) are included by editing the model file.