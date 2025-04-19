## ⚡️ High-Performance XML Parsing and Generation with Ox

For ultra-fast read/write of XML, consider the `Ox` gem, which outperforms Nokogiri in many benchmarks. Ox supports both SAX-like handlers and object mapping, giving you control over speed and memory.

```ruby
require 'ox'

# Parsing to a Ruby object tree
Ox.default_options = {mode: :generic, symbolize_keys: true}
obj = Ox.load_file('large.xml')
puts obj[:root][:item].first[:name]

# Streaming parse using a handler
def handler
  Ox.sax_parse(Ox::Sax.new { |config|
    config.start_element do |name, attrs|
      puts "Start: #{name}, Attributes: #{attrs}"
    end
    config.text do |text|
      puts "Text: #{text.strip}" unless text.strip.empty?
    end
  }, File.open('large.xml'))
end

# Generating XML quickly
o = {:root => {:item => [{:name => 'foo'}, {:name => 'bar'}]}}
xml_str = Ox.dump(o, indent: 2)
puts xml_str
```

Ox highlights:
- `mode: :generic` builds a pure Ruby Hash/Array tree.
- `Ox.load_file` is memory-efficient when combined with streaming handlers.
- Fast XML generation with `Ox.dump` and minimal object overhead.