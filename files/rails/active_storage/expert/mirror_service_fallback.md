## 🔀 Advanced Mirror Service Configuration

Leverage Active Storage’s mirror service to write uploads to multiple backends with automatic failover. This ensures your files are durably stored across primary and mirror services, and you can dynamically choose or fall back to alternative stores at runtime.

1. Configure your `config/storage.yml`:

```yaml
mirror:
  service: Mirror
  primary: amazon
  mirrors:
    - google
    - local

amazon:
  service: S3
  bucket: <%= ENV['S3_BUCKET'] %>
  ...

google:
  service: GCS
  bucket: <%= ENV['GCS_BUCKET'] %>

local:
  service: Disk
  root: <%= Rails.root.join("storage") %>
```

2. Attach using the mirror service in your model or controller:

```ruby
class Document < ApplicationRecord
  has_one_attached :file, service: :mirror
end

# Runtime override or fallback:
document.file.blob.open(tmp_io: true) do |io|
  # On error reading from Primary, fallback to first mirror
rescue => e
  document.file.blob.service_for_direct_upload(service: :google)
end
```