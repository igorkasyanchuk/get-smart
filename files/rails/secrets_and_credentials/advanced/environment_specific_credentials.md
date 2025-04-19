## 🔒 Use Environment-Specific Credentials Files

Rails allows you to maintain separate encrypted credential stores per environment, ensuring isolation of secrets for development, staging, and production. Create files like `config/credentials/development.yml.enc`, `config/credentials/production.yml.enc` and their corresponding keys in `config/credentials/development.key` and `config/credentials/production.key`. Then load the right store automatically based on `RAILS_ENV`, and inject the master key via `ENV["RAILS_MASTER_KEY"]` in your CI/CD pipeline.

```yaml
# config/credentials/production.yml.enc
aws:
  access_key_id: PROD_AWS_KEY
  secret_access_key: PROD_SECRET
``` 

```ruby
# Anywhere in your Rails app
aws_cfg = Rails.application.credentials.aws
Aws::S3::Client.new(
  access_key_id: aws_cfg[:access_key_id],
  secret_access_key: aws_cfg[:secret_access_key]
)
```