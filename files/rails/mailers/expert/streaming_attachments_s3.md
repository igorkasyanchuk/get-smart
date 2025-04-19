## 📦 Streaming Large Attachments Directly from S3

Avoid loading gigabyte‑scale files into memory by streaming attachments as IO objects. Use `open-uri` with streaming and Tempfile to keep memory footprint low.

```ruby
# app/mailers/report_mailer.rb
require 'open-uri'
class ReportMailer < ApplicationMailer
  def heavy_report(user)
    file = Tempfile.new(['report', '.pdf'])
    URI.open(user.report_url, "rb", &:read) do |stream|
      IO.copy_stream(stream, file)
    end
    file.rewind

    attachments['report.pdf'] = {
      mime_type: 'application/pdf',
      content: file.read
    }

    mail(to: user.email, subject: "Your Heavy Report")
  ensure
    file.close!
  end
end
```

This pattern streams directly from S3 (or any HTTP source) without buffering entire payloads in Ruby’s heap.