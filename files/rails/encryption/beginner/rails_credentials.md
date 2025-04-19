## 🔑 Store Secrets in Encrypted Credentials

Rails provides a single encrypted `credentials.yml.enc` file to keep API keys, tokens, and other secrets out of your repo. To add or update secrets, run:

```bash
EDITOR="code --wait" rails credentials:edit
```

This opens an editor that decrypts `config/credentials.yml.enc` using `config/master.key`. Add your secrets under a top‐level key:

```yaml
# config/credentials.yml.enc
api_key: 12345-ABCDE
aws:
  access_key_id: AKIA...
  secret_access_key: xyz...
```

Access them in your app via `Rails.application.credentials`:

```ruby
Rails.application.credentials.api_key
Rails.application.credentials.dig(:aws, :access_key_id)
```
