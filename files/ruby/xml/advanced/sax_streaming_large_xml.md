## 📥 Leveraging SAX Parsing for Large XML Streams

When working with massive XML files, loading the entire document into memory can be prohibitive. Using Nokogiri’s SAX parser lets you process elements one by one in a streaming fashion, keeping memory usage minimal. Define a custom handler to respond to events like `start_element`, `characters`, and `end_element`.

```ruby
require 'nokogiri'

class StreamHandler < Nokogiri::XML::SAX::Document
  def start_element(name, attrs = [])
    @current = name
    @attrs = Hash[*attrs.flatten]
  end

  def characters(string)
    return if string.strip.empty?
    puts "Element: #{@current}, Text: #{string.strip}"
  end

  def end_element(name)
    # finalize or clean up per-element logic here
  end
end

parser = Nokogiri::XML::SAX::Parser.new(StreamHandler.new)
parser.parse(File.open('huge_data.xml'))
```

This approach fires callbacks per node, so you can filter, transform, or store data incrementally without high memory overhead.