## 🛠️ Benchmark ActiveRecord to Detect N+1 Queries

Compare plain queries vs. eager‑loaded queries to avoid N+1 issues. Wrap both in a benchmark block to quantify the gain from using `includes`.

```ruby
require 'benchmark'

Benchmark.bm(15) do |x|
  x.report('without includes:') do
    100.times { Post.all.each { |p| p.comments.size } }
  end

  x.report('with includes:   ') do
    100.times { Post.includes(:comments).each { |p| p.comments.size } }
  end
end
```

This prints a side‑by‑side comparison. If `with includes` is significantly faster, eager loading is saving you database round trips.