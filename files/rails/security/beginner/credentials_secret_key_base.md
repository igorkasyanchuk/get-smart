## 📡 Secure Secret Key Base with Credentials
Store `secret_key_base` and API keys in Rails encrypted credentials, not in plaintext files or environment variables directly.

```bash
EDITOR="vim" rails credentials:edit
```

```yaml
# credentials.yml.enc
default:
  secret_key_base: your_encrypted_secret
  aws:
    access_key_id: xxxxx
    secret_access_key: yyyyy
```