## ✨ Extending IRB with Magic Commands
Implement custom `%`-prefixed commands (à la IPython) for repetitive tasks like reloading, schema introspection, or database queries.

```ruby
module IRB
  module ExtendCommandBundle
    def reload_models
      Dir["app/models/*.rb"].each { |f| load f }
      puts "Models reloaded"
    end
    def schema(table)
      ActiveRecord::Base.connection.columns(table).map(&:name)
    end
  end
end
IRB.conf[:IRB_RC] = proc do |conf|
  conf.extend IRB::ExtendCommandBundle
end
```

Now, in IRB, run `reload_models` or `schema('users')` as top-level commands without parentheses.