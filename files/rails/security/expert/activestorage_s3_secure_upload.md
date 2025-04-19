## 📦 Secure Direct ActiveStorage Uploads
When allowing clients to upload directly to S3, validate blob metadata and scan for malware before attachment. Intercept the direct upload lifecycle to enforce content-type whitelists and virus checks.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_one_attached :avatar
  validate :avatar_metadata_and_scan

  private

  def avatar_metadata_and_scan
    return unless avatar.attached?

    unless avatar.content_type.in?(%w[image/png image/jpeg])
      errors.add(:avatar, 'must be PNG or JPEG')
    end

    result = Clamby.safe?(avatar.download)
    errors.add(:avatar, 'contains a virus') unless result
  end
end
```

Pair it with a JS direct upload workflow so that only pre-scrubbed blobs reach your record layer.
