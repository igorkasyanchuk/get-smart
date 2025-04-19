## 🔒 Edit Your Encrypted Credentials

Rails provides an encrypted credentials store out of the box to keep API keys and secrets safe. To add or update secrets, open the credentials editor, which decrypts `config/credentials.yml.enc`, lets you edit it in your chosen editor, then re-encrypts it on save.

```bash
# Use your preferred editor (vim, nano, etc.)
EDITOR="vim" bin/rails credentials:edit
```

Inside the editor, you might add:

```yaml
aws:
  access_key_id: "your-access-key-id"
  secret_access_key: "your-secret-access-key"
```

After saving, Rails will handle encryption automatically. Be sure to commit only `credentials.yml.enc` and keep `config/master.key` secure.