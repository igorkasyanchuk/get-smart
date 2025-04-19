## 🧪 Implementing Profunctor-Style Adapters for Data Transformation
Adopt a profunctor pattern by defining `dimap` on procs to pre- and post-process inputs/outputs. This enables building highly composable adapters for parsing, validation, and serialization flows.

```ruby
module ProcProfunctor
  def dimap(f, g)
    ->(x) { g.call(self.call(f.call(x))) }
  end
end

transform = ->(s) { JSON.parse(s) }
pre  = ->(raw) { raw.strip }
post = ->(hash) { OpenStruct.new(hash) }

transform.extend(ProcProfunctor)
adapter = transform.dimap(pre, post)

raw = " { \"name\": \"Alice\" } "
user = adapter.call(raw)
puts user.name # => "Alice"
```

Leverage these adapters to unify your data flow in microservices or ETL pipelines.