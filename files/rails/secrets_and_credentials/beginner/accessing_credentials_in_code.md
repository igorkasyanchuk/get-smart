## 🛠️ Access Credentials in Application Code

Once your secrets are stored, you can fetch them in any part of your Rails app using `Rails.application.credentials`. This keeps sensitive values out of your codebase.

```ruby
# e.g., config/initializers/aws.rb
Aws::S3::Client.new(
  access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
  secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key)
)
```

You can also retrieve a top‑level key directly:

```ruby
stripe_key = Rails.application.credentials.stripe[:secret_key]
```