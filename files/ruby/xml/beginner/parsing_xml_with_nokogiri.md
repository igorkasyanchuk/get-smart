## 🔍 Parsing XML with Nokogiri

Nokogiri is a popular gem for parsing and querying XML. It provides a simple API to load XML from strings or files and search nodes using CSS or XPath selectors. Here's how you can get started by parsing an XML string and extracting node values.

```ruby
require 'nokogiri'

xml_data = <<-XML
<books>
  <book id="1">
    <title>Ruby 101</title>
    <author>Jane Doe</author>
  </book>
  <book id="2">
    <title>XML Mastery</title>
    <author>John Smith</author>
  </book>
</books>
XML

doc = Nokogiri::XML(xml_data)
# Get the first book title
title = doc.at_xpath('//book/title').text
puts "First book title: #{title}"  # => "First book title: Ruby 101"
```