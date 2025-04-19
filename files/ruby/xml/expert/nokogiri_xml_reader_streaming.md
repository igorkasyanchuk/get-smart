## 🚀 Stream Large XML with Nokogiri::XML::Reader

When you need to process multi-GB XML files without exhausting memory, switch from DOM parsing to a pull parser using `Nokogiri::XML::Reader`. It yields element nodes on demand, letting you inspect or transform only the bits you care about.

```ruby
require 'nokogiri'

reader = Nokogiri::XML::Reader(File.open('huge_data.xml'))
reader.each do |node|
  # Only process <record> elements
  next unless node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT && node.name == 'record'

  # Lazily parse this fragment into a Nokogiri::XML::Document
  fragment = Nokogiri::XML(node.outer_xml)
  id       = fragment.at_xpath('//record/@id').value
  content  = fragment.at_xpath('//record/content').text
  # …perform heavy work or save to DB…
end
reader.close
```
