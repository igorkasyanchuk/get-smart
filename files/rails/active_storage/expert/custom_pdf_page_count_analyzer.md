## 🛠️ Building a Custom PDF Page Count Analyzer

Extend Active Storage with a bespoke analyzer to extract PDF metadata, such as page counts or embedded fonts, and store it in your blob’s metadata for querying or UI display.

1. Create the analyzer under `app/analyzers`:

```ruby
# app/analyzers/active_storage/analyzer/pdf_page_count_analyzer.rb
require 'pdf-reader'

class ActiveStorage::Analyzer::PdfPageCountAnalyzer < ActiveStorage::Analyzer::Base
  def metadata
    reader = PDF::Reader.new(file.download)
    { page_count: reader.page_count }
  rescue => e
    logger.error "Failed to analyze PDF: #{e}";
    {}
  end
end
```

2. Register and invoke on attach:

```ruby
t# config/initializers/active_storage.rb
ActiveStorage::Analyzer.register :pdf, ActiveStorage::Analyzer::PdfPageCountAnalyzer

class Report < ApplicationRecord
  has_one_attached :pdf
  after_commit :extract_page_count, on: :create

  def extract_page_count
    pdf.analyze unless pdf.analyzed?
  end
end
```

Now `report.pdf.metadata[:page_count]` holds your custom value.