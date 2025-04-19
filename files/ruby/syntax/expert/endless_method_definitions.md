## 🪄 Endless Method Definitions for Conciseness

Ruby 3 introduced `def name = expr` syntax for one-line method definitions. Combine this with predicate and bang methods to write self‑documenting, terse APIs.

```ruby
class Config
  def host = ENV.fetch("HOST", "localhost")
  def port = (ENV["PORT"] || 3000).to_i
  def valid? = host.match?(/\w+/) && port.between?(1, 65_535)
end

cfg = Config.new
puts cfg.valid?  # true or false
```