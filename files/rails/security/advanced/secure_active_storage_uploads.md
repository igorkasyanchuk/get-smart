## 📁 Secure ActiveStorage Direct Uploads

Validate file types, limit sizes, and scan for viruses on direct uploads to S3 or GCS using background jobs.

```ruby
# app/models/document.rb
has_one_attached :file

validate :acceptable_file

def acceptable_file
  return unless file.attached?
  unless file.byte_size <= 10.megabytes
    errors.add(:file, 'is too big')
  end
  acceptable_types = ['application/pdf', 'image/png']
  unless acceptable_types.include?(file.blob.content_type)
    errors.add(:file, 'must be PDF or PNG')
  end
end
```