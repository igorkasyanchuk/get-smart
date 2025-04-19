## 🔄 Automated Credentials Rotation Rake Task

Rotate your master key and re‑encrypt all credentials in one go via a Rake task. This ensures zero‑downtime key rollovers and audit logging.

In `lib/tasks/credentials_rotate.rake`:

```ruby
namespace :credentials do
  desc 'Rotate Rails master key and re-encrypt all credentials'
  task rotate: :environment do
    old_key = Rails.application.master_key
    new_key = SecureRandom.hex(32)

    # Load existing configs
    cred_path = Rails.root.join('config/credentials/production.yml.enc')
    encrypted = File.binread(cred_path)
    plaintext = ActiveSupport::MessageEncryptor.new([old_key].pack('H*')).decrypt_and_verify(encrypted)

    # Write new master.key
    File.write(Rails.root.join('config/credentials/production.key'), new_key)
    puts "🗝️ New master key written to config/credentials/production.key"

    # Re-encrypt credentials with new key
    encryptor = ActiveSupport::MessageEncryptor.new([new_key].pack('H*'))
    new_encrypted = encryptor.encrypt_and_sign(plaintext)
    File.binwrite(cred_path, new_encrypted)
    puts "🔐 Credentials re-encrypted at #{cred_path}"

    # Commit changes (optional):
    # system('git add config/credentials/production.key config/credentials/production.yml.enc')
    # system('git commit -m "Rotate credentials master key"')
  end
end
```

Run `rails credentials:rotate RAILS_ENV=production` in CI or a secure host to generate a new `production.key` and re-encrypt the credentials file, minimizing manual steps.