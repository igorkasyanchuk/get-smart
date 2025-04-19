## 🔧 Build Namespaced XML with Nokogiri::XML::Builder and Schema Compliance

To generate complex, multi-namespace XML that must pass XSD validation, leverage `Nokogiri::XML::Builder` and cache your schema object for reuse. This approach ensures correct prefixes, attributes, and performance when building thousands of documents per second.

```ruby
require 'nokogiri'

# Cache XSD for validation
XSD = Nokogiri::XML::Schema(File.read('invoice_schema.xsd'))

document = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
  xml['inv'].Invoice('xmlns:inv' => 'http://example.com/invoice',
                     'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
                     'xsi:schemaLocation' => 'http://example.com/invoice invoice_schema.xsd') do
    xml['inv'].Header do
      xml['inv'].InvoiceNumber 'INV-2024-001'
      xml['inv'].Date          Time.now.iso8601
    end
    xml['inv'].LineItems do
      xml['inv'].Item(id: '1001') do
        xml['inv'].Description 'Expert Ruby Tips Book'
        xml['inv'].Quantity    2
        xml['inv'].UnitPrice   '49.99'
      end
    end
  end
end.doc

# Validate and raise on errors
diagnostics = XSD.validate(document)
raise "Invalid XML: #{diagnostics.map(&:message).join('; ')}" unless diagnostics.empty?