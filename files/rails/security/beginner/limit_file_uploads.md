## 📦 Validate and Limit File Uploads
When using Active Storage, check file types and sizes to prevent malicious uploads. Add validations in your model.

```ruby
class Document < ApplicationRecord
  has_one_attached :file

  validate :acceptable_file

  def acceptable_file
    return unless file.attached?
    unless file.byte_size <= 1.megabyte
      errors.add(:file, 'is too big')
    end
    acceptable_types = ['application/pdf', 'image/jpeg']
    unless acceptable_types.include?(file.content_type)
      errors.add(:file, 'must be a PDF or JPEG')
    end
  end
end
```