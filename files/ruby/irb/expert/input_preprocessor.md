## 🛠️ Preprocess and Transform Input
Intercept and transform user input before IRB evaluates it. Useful for auto-wrapping methods or injecting debugging hooks.

```ruby
module IRB
  class InputTransformer
    def transform(line)
      # Auto-wrap single-line `foo` calls in puts for quick inspection
      if line.strip =~ /^\w+$/
        "puts(#{line.strip})"
      else
        super
      end
    end
  end
end
```

Place this in `~/.irbrc` to automatically wrap bare identifiers in `puts`. You can use this hook to inject logging, profiling, or custom DSL expansion.