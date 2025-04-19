## 🔑 Access Nested Credentials

You can structure your credentials file with nested keys to group related secrets, which improves organization and readability. For example, define a section for third‐party services in `config/credentials.yml.enc`:

```yaml
# config/credentials.yml.enc
stripe:
  public_key: pk_test_1234567890abcdef
  secret_key: sk_test_abcdef1234567890
```

Retrieve nested values in your Rails code using `dig` or `fetch`:

```ruby
stripe_creds = Rails.application.credentials.dig(:stripe)
public_key  = stripe_creds[:public_key]
secret_key  = stripe_creds[:secret_key]
```