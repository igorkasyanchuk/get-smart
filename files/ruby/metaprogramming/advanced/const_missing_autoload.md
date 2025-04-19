## ⚙️ `const_missing` for on‑demand autoloading
Leverage `const_missing` to intercept constant resolution failures and load code dynamically, reducing startup times and memory footprint. Be careful to avoid infinite recursion by removing your hook when delegating to `super`.

```ruby
module AutoLoader
  def self.const_missing(const)
    file = const.to_s.downcase
    require_relative file
    const_get(const)
  rescue LoadError
    super
  end
end

Object.extend(AutoLoader)
```