## ⚙️ Dynamic Method Generation via `define_method`
Generate methods at runtime based on metadata, reducing boilerplate and enabling flexible APIs. By iterating over a list of attributes or actions, you can produce customized methods without repetitive code.

```ruby
class APIClient
  %i[get post put delete].each do |http_verb|
    define_method(http_verb) do |path, params={}|
      request(http_verb, path, params)
    end
  end

  private
  def request(verb, path, params)
    # perform HTTP call
  end
end
```

This approach adapts easily when verbs or actions change, keeping your class DRY.