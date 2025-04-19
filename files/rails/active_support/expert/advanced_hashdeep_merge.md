## 🔀 Perform Deep Merges on Indifferent Hashes
ActiveSupport adds `deep_merge` to core hashes, but combining with `HashWithIndifferentAccess` ensures indifferent key access throughout nested structures. This is indispensable for merging complex JSON configs.

```ruby
config_a = { foo: { bar: 1 } }.with_indifferent_access
config_b = { foo: { baz: 2 } }
merged = config_a.deep_merge(config_b)

# merged[:foo][:bar] == 1; merged[:foo][:baz] == 2
```

Wrap within an initializer to override `Hash` globally if you need ubiquitous support.