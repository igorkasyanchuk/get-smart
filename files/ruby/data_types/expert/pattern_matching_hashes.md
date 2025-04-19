## 🧩 Pattern Matching on Complex Hashes

Ruby 2.7+ supports destructuring via pattern matching, letting you concisely extract deeply nested values without manual guards. This is invaluable when handling JSON‑like payloads.

```ruby
payload = {
  user: {
    id: 42,
    profile: {
      name: "Carol",
      stats: { posts: 100, followers: 2500 }
    }
  }
}

case payload
in { user: { profile: { stats: { posts: posts, followers: f } } } }
  puts "Posts: #{posts}, Followers: #{f}"
else
  puts "Unexpected format"
end
```