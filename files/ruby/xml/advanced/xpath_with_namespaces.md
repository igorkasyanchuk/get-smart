## 🌐 Manipulating Namespaced XML with Advanced XPath

XML with multiple namespaces can be tricky to query. Nokogiri lets you register namespace prefixes and then use them in XPath expressions. This is invaluable when extracting values from deeply nested, namespaced documents.

```ruby
require 'nokogiri'
xml = <<-XML
<root xmlns:dc="http://purl.org/dc/elements/1.1/">
  <dc:record>
    <dc:title>Advanced Ruby XML</dc:title>
    <dc:date>2024-01-01</dc:date>
  </dc:record>
</root>
XML

doc = Nokogiri::XML(xml)
# Register the namespace prefix 'dc'
doc.remove_namespaces! # optional: flatten if you only have one, but to keep:
# doc.root.add_namespace('dc', 'http://purl.org/dc/elements/1.1/')

titles = doc.xpath('//dc:record/dc:title', 'dc' => 'http://purl.org/dc/elements/1.1/')
titles.each do |node|
  puts "Title: #{node.text}"
end
```

Key points:
- Always provide the correct URI for each prefix.
- Use `doc.remove_namespaces!` when you need a quick namespace-agnostic parse.
- Complex XPath queries can include predicates, functions, and axes even with namespaces.