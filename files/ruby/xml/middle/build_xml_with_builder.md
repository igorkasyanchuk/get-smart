## 🛠️ Building XML with the Builder Gem
For generating XML programmatically, the Builder gem offers a clean DSL that maps Ruby blocks to XML nodes. This approach helps maintain readability and ease-of-change when constructing nested structures.

```ruby
require 'builder'

def generate_feed(posts)
  xml = Builder::XmlMarkup.new(indent: 2)
  xml.instruct!  # <?xml version="1.0" encoding="UTF-8"?>
  xml.feed(xmlns: 'http://www.w3.org/2005/Atom') do
    posts.each do |post|
      xml.entry do
        xml.id       post.id
        xml.title    post.title
        xml.updated  post.updated_at.iso8601
        xml.author do
          xml.name post.author_name
        end
      end
    end
  end
end

posts = [OpenStruct.new(id: 1, title: 'Hello', updated_at: Time.now, author_name: 'Alice')]
puts generate_feed(posts)
```