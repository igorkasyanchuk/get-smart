## 🔄 Rotate Master Key Safely

Periodically rotating your `master.key` reduces the blast radius if it ever leaks. First, back up your old key, then edit any credentials file (which will generate a new `master.key`), and finally commit both the updated `config/credentials.yml.enc` and new `config/master.key` to version control.

```bash
# 1. Backup old key
cp config/master.key config/master.key.backup

# 2. Open credentials to trigger a new master.key
EDITOR="nano" bin/rails credentials:edit

# 3. Review and commit changes
git add config/master.key config/credentials.yml.enc
git commit -m "Rotate Rails master key and update credentials"
```