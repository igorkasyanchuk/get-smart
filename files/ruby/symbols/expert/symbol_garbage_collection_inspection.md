## 🗑️ Inspect and Manage Symbol Garbage Collection

Ruby 2.2+ introduced GC for dynamically created symbols, but understanding its behavior is crucial for long‐running processes. Use `Symbol.all_symbols` in combination with `GC.start` and `GC.stat` to measure the effect of symbol creation and GC sweeps, identifying leaks in symbol-heavy workloads.

```ruby
# Before creating dynamic symbols
puts GC.stat[:symbol_count]

1000.times { |i| "temp_").to_sym }

# Force a GC cycle
GC.start
puts GC.stat[:symbol_count]
```

By comparing `:symbol_count` before and after GC, you can detect excessive symbol churn. In cases where dynamic symbol generation is unavoidable, consider using string-based keys or a symbol cache with controlled eviction to minimize memory pressure.