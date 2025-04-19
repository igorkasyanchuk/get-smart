## 🛠️ Basic XML Parsing with REXML

`REXML` is part of Ruby's standard library and lets you parse and navigate XML without external gems. You can load documents from strings or files and iterate through elements easily. Here's how to read node attributes and text values.

```ruby
require 'rexml/document'
include REXML

xml_data = '<library><book id="101" title="Learn Ruby"/><book id="102" title="XML Basics"/></library>'
doc = Document.new(xml_data)

doc.elements.each('library/book') do |book|
  id = book.attributes['id']
  title = book.attributes['title']
  puts "Book (##{id}): #{title}"
end
# Output:
# Book (#101): Learn Ruby
# Book (#102): XML Basics
```