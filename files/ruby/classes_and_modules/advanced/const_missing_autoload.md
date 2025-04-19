## 🌐 Autoload on the Fly with `const_missing`

Override `const_missing` in your module to auto-require files, enabling on-demand loading without `autoload`.

```ruby
module API
  def self.const_missing(const)
    require_relative "api/#{const.to_s.downcase}"
    const_get(const)
  rescue LoadError
    super
  end
end

# When you reference API::UsersClient, it loads 'api/usersclient.rb'
client = API::UsersClient.new
```

Be careful: this affects constant lookup and can mask name errors.