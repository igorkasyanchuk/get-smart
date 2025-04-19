## 🛠️ Extending JSON::Ext::Generator::State for Custom Serialization

For low-level control over JSON output—such as tweaking whitespace, injecting metadata, or handling circular references—subclass JSON::Ext::Generator::State. Override methods like `array`, `hash`, or `generate_value` to implement complex serialization logic.

```ruby
require 'json'

class PrettyState < JSON::Ext::Generator::State
  def initialize(options = {})
    super
    self.space = " "            # Space after colon
    self.space_before = ""      # No space before colon
    self.object_nl = "\n"      # Newline after object
    self.array_nl = "\n"       # Newline after array elements
  end

  # Insert a custom header before root object
  def generate(object)
    write("/* Generated at: #{Time.now.utc} */\n")
    super
  end
end

data = {name: 'Alice', scores: [10, 20, 30]}
json = JSON.generate(data, state: PrettyState.new)
puts json
```