## 🔀 Deep Merge Nested Hashes
ActiveSupport’s `deep_merge` recursively merges nested hashes, preserving existing keys unless overridden. Use it to combine default settings with user-provided overrides cleanly.

```ruby
defaults = { settings: { volume: 10, theme: 'dark' } }
custom   = { settings: { volume: 20 } }
merged = defaults.deep_merge(custom)
# => { settings: { volume: 20, theme: 'dark' } }
```
