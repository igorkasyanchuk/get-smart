## ✍️ Building XML with Nokogiri::XML::Builder

Nokogiri also allows you to construct XML documents programmatically with its `XML::Builder` class. This is useful when you need to generate XML from Ruby objects. Below is an example creating a simple XML structure for a list of users.

```ruby
require 'nokogiri'

builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
  xml.users do
    xml.user(id: 1) do
      xml.name 'Alice'
      xml.email 'alice@example.com'
    end
    xml.user(id: 2) do
      xml.name 'Bob'
      xml.email 'bob@example.com'
    end
  end
end

puts builder.to_xml
# => <?xml version="1.0" encoding="UTF-8"?>
# <users>
#   <user id="1">
#     <name>Alice</name>
#     <email>alice@example.com</email>
#   </user>
#   <user id="2">
#     <name>Bob</name>
#     <email>bob@example.com</email>
#   </user>
# </users>
```