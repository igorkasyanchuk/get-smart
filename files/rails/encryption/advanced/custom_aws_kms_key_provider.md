## 🔑 Custom Key Provider with AWS KMS

Rails 7+ allows you to swap out the default key provider for a custom one backed by AWS KMS, ensuring keys never reside in your codebase. You can subclass `ActiveRecord::Encryption::KeyProvider` to fetch keys dynamically at runtime.

```ruby
# app/lib/aws_kms_key_provider.rb
class AwsKmsKeyProvider < ActiveRecord::Encryption::KeyProvider
  def primary_key
    fetch_key_from_kms(ENV['KMS_KEY_ID'])
  end

  def previous_keys
    Array(ENV['KMS_KEY_PREVIOUS_IDS']).map { |id| fetch_key_from_kms(id) }
  end

  private

  def fetch_key_from_kms(key_id)
    Aws::KMS::Client.new(region: 'us-east-1').decrypt(
      ciphertext_blob: Base64.decode64(ENV["KMS_ENCRYPTED_#{key_id}"])
    ).plaintext
  end
end
```

```ruby
# config/application.rb
module YourApp
  class Application < Rails::Application
    # use custom AWS KMS provider for encryption keys
    config.active_record.encryption.key_provider = AwsKmsKeyProvider.new
  end
end
```
