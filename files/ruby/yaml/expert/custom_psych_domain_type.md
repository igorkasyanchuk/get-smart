## 🛠️ Custom Domain Type Handlers with Psych

You can register custom YAML tags to round-trip domain-specific objects seamlessly between Ruby and YAML. Override `to_yaml` or implement `encode_with` and register constructors via `YAML.add_domain_type` to control serialization/deserialization. This leverages Psych’s visitor API to maintain object integrity, versioning, and custom tag URIs.

```ruby
require 'yaml'

class Money
  attr_reader :currency, :amount

  def initialize(currency, amount)
    @currency = currency
    @amount = amount
  end

  def to_yaml(opts = {})
    YAML.quick_emit(self, opts) do |out|
      out.map(taguri) do |map|
        map.add('currency', currency)
        map.add('amount', amount)
      end
    end
  end
end

YAML.add_domain_type('example.com,2023', 'money') do |_tag, val|
  Money.new(val['currency'], val['amount'])
end

yaml = Money.new('USD', 100).to_yaml
puts yaml
obj = YAML.safe_load(yaml)
puts obj.class  # => Money
```