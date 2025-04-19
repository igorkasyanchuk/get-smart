## 🔍 Custom Blob Analysis for Metadata Extraction

Active Storage automatically extracts basic metadata, but you can hook custom analyzers to gather EXIF data, video duration, or custom checksums. Create a new analyzer and register it.

```ruby
# app/analyzers/active_storage/analyzer/exif_analyzer.rb
module ActiveStorage
  class Analyzer::ExifAnalyzer < Analyzer
    def metadata
      return {} unless image?
      exif = MiniMagick::Image.open(blob.service.send(:path_for, blob.key)).exif
      { exif: exif.slice('DateTimeOriginal', 'Make', 'Model') }
    end

    private

    def image?
      blob.content_type.start_with? 'image'
    end
  end
end

# config/initializers/active_storage.rb
ActiveStorage::Analyzer.register :exif, ActiveStorage::Analyzer::ExifAnalyzer

# Usage: metadata is available on the blob:
blob.metadata[:exif]
```