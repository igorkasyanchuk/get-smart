## 🔄 Switch Storage Services Dynamically
You can route uploads to different services (e.g., local vs. S3) per attachment or environment. This is handy for multi-tenant apps or feature flags.

```yaml
# config/storage.yml
local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

s3:
  service: S3
  bucket: my-app-bucket
  access_key_id: <%= ENV['AWS_ACCESS_KEY_ID'] %>
  secret_access_key: <%= ENV['AWS_SECRET_ACCESS_KEY'] %>
  region: us-east-1
```

```ruby
class Report < ApplicationRecord
  has_one_attached :file

  def upload_to_s3!
    file.blob.update!(service_name: 's3')
  end
end
```

After calling `upload_to_s3!`, the blob is moved to the S3 service on next access. This lets you retain local service for small files and S3 for large or permanent assets.