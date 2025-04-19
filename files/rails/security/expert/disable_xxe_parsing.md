## 📛 Disable XXE Attacks in XML Parsing
By default, many XML parsers resolve external entities, opening you up to XXE attacks. Always disable network access (`NONET`) and disallow DTD loading in any XML handling code.

```ruby
# config/initializers/xml_security.rb
require 'nokogiri'

Nokogiri::XML::Document.parse(xml_string, nil, nil,
  Nokogiri::XML::ParseOptions::NOBLANK |
  Nokogiri::XML::ParseOptions::NOENT   |
  Nokogiri::XML::ParseOptions::NONET)
```

This configuration prevents external entity expansion and external resource inclusion at parse time.
