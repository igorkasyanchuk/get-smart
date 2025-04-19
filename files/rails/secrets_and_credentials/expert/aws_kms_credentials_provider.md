## 🔐 AWS KMS as a Custom Key Provider

For heightened security, avoid storing your master key on disk by using AWS KMS to decrypt your credentials key at runtime. Create a custom key provider that calls KMS to unwrap an encrypted key blob stored in an environment variable.

In `config/initializers/kms_credentials.rb`:

```ruby
require 'aws-sdk-kms'

kms_client = Aws::KMS::Client.new(region: 'us-east-1')
key_provider = -> do
  # KMS_CREDENTIALS_BLOB is a Base64 of the encrypted master key
  blob = Base64.decode64(ENV.fetch('KMS_CREDENTIALS_BLOB'))
  kms_client.decrypt(ciphertext_blob: blob).plaintext
end

Rails.application.config.read_encrypted_secrets = ActiveSupport::EncryptedConfiguration.new(
  config_path: Rails.root.join('config/credentials/aws_kms.yml.enc'),
  key_provider: key_provider,
  env_cipher: 'RAILS_MASTER_KEY_IV' # optional: use ENV for the IV if you rotate it
)
```

Your `aws_kms.yml.enc` remains encrypted with a data key from KMS; the code only holds the encrypted blob. Access credentials as usual:

```ruby
Rails.application.credentials.dig(:database, :username)
```