## ⚡ Implement Custom SAX Handlers for High-Performance XML Processing

For ultra-low-latency parsing (e.g., real-time feeds), write a custom SAX handler by subclassing `Nokogiri::XML::SAX::Document`. This gives you callback-based control over every start tag, text node, and end tag without building a DOM.

```ruby
require 'nokogiri'

class FastSaxHandler < Nokogiri::XML::SAX::Document
  def initialize
    @stack = []
  end

  def start_element(name, attrs = [])
    # Push a context hash for each element
    context = { name: name, attrs: attrs.to_h, content: '' }
    @stack.push(context)
  end

  def characters(string)
    # Accumulate text in the current context
    @stack.last[:content] << string if @stack.any?
  end

  def end_element(name)
    ctx = @stack.pop
    # Process fully read element when closed
    if name == 'event'
      handle_event(ctx[:attrs], ctx[:content].strip)
    end
  end

  private

  def handle_event(attrs, content)
    # Custom business logic: push to queue, log, or transform
    puts "Event #{attrs['id']}: #{content[0..50]}..."
  end
end

parser = Nokogiri::XML::SAX::Parser.new(FastSaxHandler.new)
parser.parse_file('stream.xml')
```
