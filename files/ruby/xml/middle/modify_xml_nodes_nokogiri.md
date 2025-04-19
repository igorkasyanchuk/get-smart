## ✏️ Modifying XML Nodes with Nokogiri
Updating an existing XML document—adding, editing, or removing nodes—is easy with Nokogiri’s node manipulation API. You can clone nodes, change attributes, or insert elements at specific locations.

```ruby
require 'nokogiri'

xml = <<-XML
<books>
  <book id="1"><title>Old Title</title></book>
</books>
XML

doc = Nokogiri::XML(xml)

# Update title text
doc.at_xpath('//book[@id="1"]/title').content = 'New Title'

# Add a new element
new_book = Nokogiri::XML::Node.new('book', doc)
new_book['id'] = '2'
new_title = Nokogiri::XML::Node.new('title', doc)
new_title.content = 'Second Book'
new_book.add_child(new_title)
doc.root.add_child(new_book)

# Remove the old book
doc.xpath('//book[@id="1"]').remove

puts doc.to_xml(indent: 2)
```