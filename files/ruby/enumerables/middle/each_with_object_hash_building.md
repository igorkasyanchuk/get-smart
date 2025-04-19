## 🔧 Build Hashes with each_with_object

When you need to accumulate results into a custom structure like a hash or array, `each_with_object` is more concise than initializing externally. You pass an initial object and mutate it within the block, returning the same object at the end.

```ruby
languages = ['ruby', 'rails', 'java', 'ruby']
counts = languages.each_with_object(Hash.new(0)) do |lang, acc|
  acc[lang] += 1
end
# => {"ruby"=>2, "rails"=>1, "java"=>1}
```