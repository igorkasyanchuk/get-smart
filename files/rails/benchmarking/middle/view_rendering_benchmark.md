## 🌐 Benchmark View Rendering: Partials vs Collections

Measure performance of rendering partials one‑by‑one versus using collection rendering. This helps optimize heavy views when you have large lists.

```ruby
# in a controller action or console
require 'benchmark'

posts = Post.limit(500).to_a

puts Benchmark.measure {
  ApplicationController.renderer.render(
    partial: 'posts/post', collection: posts
  )
}

puts Benchmark.measure {
  posts.map do |post|
    ApplicationController.renderer.render(
      partial: 'posts/post', locals: { post: post }
    )
  end.join
}
``` 

Collection rendering typically batches lookups and reduces context setup. Use these numbers to decide which pattern scales better.