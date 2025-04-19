## 🔧 Dynamic Memoization with Symbols and Instance Variables

For expensive computations across multiple methods, use a list of symbols and `define_method` to build memoized accessors dynamically. By constructing instance‑variable names from symbols, you can lazily compute and cache values without rewriting boilerplate for each method. This pattern keeps your class definitions DRY and ensures per‑instance caching.

```ruby
class DataFetcher
  MEMOIZED = %i[user_count post_count comment_count]

  MEMOIZED.each do |name|
    ivar = "@#{name}".to_sym
    define_method(name) do
      if instance_variable_defined?(ivar)
        instance_variable_get(ivar)
      else
        result = send("compute_#{name}")
        instance_variable_set(ivar, result)
      end
    end
  end

  private

  def compute_user_count
    # heavy DB query or external API call…
  end

  # define compute_post_count, compute_comment_count…
end
```