## 🔄 Rotating Encryption Keys Safely

When you need to rotate your primary encryption key, Rails provides a built‑in rake task to re‑encrypt existing data without downtime. First, add your new key as the new primary and keep the old one in `previous_key` so reads still succeed.

```yaml
# config/credentials.yml.enc
active_record_encryption:
  primary_key: <new_base64_key>
  previous_key: <old_base64_key>
```

Then run the built‑in task to migrate ciphertext in batches:

```bash
bin/rails db:encrypt:rotate
```

This command will decrypt each row with the old key and re-encrypt it using the new primary key, preserving data integrity and index constraints.