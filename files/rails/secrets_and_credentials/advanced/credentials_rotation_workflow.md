## 🔄 Automate Credentials Rotation Workflow

Regularly rotating your master keys and re-encrypting credentials enhances security. Use a CI/CD job or Rake task to back up your old credentials, generate a new key, and re-encrypt existing secrets programmatically—without manual `rails credentials:edit`.

```bash
# scripts/rotate_credentials.sh
#!/usr/bin/env bash
cp config/credentials/production.yml.enc backups/production-$(date +%F).yml.enc
bundle exec rails credentials:edit --environment production --key-file new_production.key <<'YAML'
$(EDITOR=cat cat config/credentials/production.yml.enc)
YAML
mv new_production.key config/credentials/production.key
``` 

```yaml
# Add this to .gitlab-ci.yml or GitHub Actions
rotate-credentials:
  script:
    - bash scripts/rotate_credentials.sh
  only:
    - schedules
```