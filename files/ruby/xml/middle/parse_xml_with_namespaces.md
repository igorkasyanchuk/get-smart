## 🔍 Parsing XML with Namespaces
When working with XML from different sources, namespaces can complicate element lookups. Nokogiri makes it straightforward to register and use namespaces when searching documents, ensuring you target the correct nodes.

```ruby
require 'nokogiri'

xml = <<-XML
<root xmlns:ns="http://example.com/ns">
  <ns:item id="1">First</ns:item>
  <ns:item id="2">Second</ns:item>
</root>
XML

doc = Nokogiri::XML(xml)
doc.remove_namespaces! # or register explicitly:
# doc.collect_namespaces #=> {"xmlns:ns"=>"http://example.com/ns"}

doc.xpath('//ns:item', 'ns' => 'http://example.com/ns').each do |item|
  puts "Item \\#{item['id']}: \\#{item.text}"
end
# Output:
# Item 1: First
# Item 2: Second
```