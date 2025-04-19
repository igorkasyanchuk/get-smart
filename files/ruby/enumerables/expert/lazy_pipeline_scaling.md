## 🚀 Combining Multiple Lazy Enumerators for Scalable Data Pipelines

When processing large or unbounded data sources, chaining `Enumerator::Lazy` methods keeps memory usage constant by avoiding intermediate arrays. You can `flat_map` across files, `grep` for patterns, `map` for transformations, and `take` the first N elements before forcing evaluation. This approach makes complex log‐processing or ETL pipelines both expressive and efficient.

```ruby
files = Dir['/var/log/**/*.log']
errors = files.lazy
              .flat_map { |f| File.foreach(f) }
              .grep(/ERROR/)        # filter lines matching ERROR
              .map(&:strip)         # remove trailing newline
              .take(500)            # limit the results
              .force                # evaluate the pipeline

puts errors.first(10)
```