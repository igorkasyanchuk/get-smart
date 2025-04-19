## 🔥 Implement Custom `to_create` for High‑Performance Bulk Inserts

FactoryBot’s default creation strategy calls `.save!` on each instance, which can be slow for large test suites. You can override `to_create` in your factory to leverage ActiveRecord’s `insert_all` or raw SQL for bulk insertion when performance is critical.

```ruby
FactoryBot.define do
  factory :metric do
    transient do
      bulk { false }
    end

    timestamp { Time.current }
    value { rand(0.0..100.0) }

    to_create do |instance|
      if instance.bulk
        Metric.insert_all!([instance.attributes.except("id", "created_at", "updated_at")])
      else
        instance.save!
      end
    end
  end
end

# In spec setup, create 10_000 metrics at once:
metrics = build_list(:metric, 10_000, bulk: true)
metrics.each(&:save!) # massively faster than one-by-one save!
```

This approach dramatically reduces DB round‑trips by batching inserts, shaving minutes off large test runs.