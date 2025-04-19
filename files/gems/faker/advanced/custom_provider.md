## 🛠️ Extending Faker with a Custom Provider

Faker ships with many built‑in providers, but you can define your own to generate domain‑specific data. Subclass `Faker::Base` (or `Faker::Provider::Base`) and define your methods, then supply a custom locale YAML file with matching keys. This lets you keep all Faker usage consistent and leverages its lookup and interpolation features.

```ruby
# lib/faker/providers/movie_quote.rb
require 'faker/provider/base'

module Faker
  class Provider::MovieQuote < Base
    flexible :movie_quote

    class << self
      def pickup_line
        fetch('movie_quote.pickup_line')
      end

      def villain_monologue
        fetch('movie_quote.villain_monologue')
      end
    end
  end
end

# config/locales/en/movie_quote.yml
en:
  faker:
    movie_quote:
      pickup_line:
        - "Are you a magician? Because whenever I look at you, everyone else disappears."
      villain_monologue:
        - "I looked into her eyes… and understood true evil."
```

Now you can call:

```ruby
Faker::MovieQuote.pickup_line        # => one of your custom lines
Faker::MovieQuote.villain_monologue # => one of your villain monologues
```