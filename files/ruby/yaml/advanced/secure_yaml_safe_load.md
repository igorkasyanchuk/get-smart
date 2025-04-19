## 🔐 Secure Safe Loading with Custom Classes and Aliases

Use `YAML.safe_load` with explicit whitelisting of classes, symbols, and alias support to prevent code injection while still deserializing complex types. This approach only allows known classes and symbols, and you can enable or disable alias resolution as needed.

```ruby
require 'yaml'
require 'date'

class Event
  attr_accessor :title, :date
  def initialize(title, date)
    @title = title
    @date  = date
  end
end

yaml_string = <<~YAML
  ---
  !ruby/object:Event
    title: "Launch"
    date: 2024-12-01
  # uses &anchor and *alias below
  details: &info
    location: "HQ"
  followup:
    <<: *info
YAML

safe = YAML.safe_load(
  yaml_string,
  permitted_classes: [Date, Event],
  permitted_symbols: [:location],
  aliases: true,
  symbolize_names: true
)

puts safe.inspect
# => {:title=>"Launch", :date=>#<Date: 2024-12-01 ...>, :details=>{:location=>"HQ"}, :followup=>{:location=>"HQ"}}