## ⚡ Use `IO.read` and `IO.write` Shortcuts

Ruby’s `IO` module provides one-line methods for common tasks. `IO.read` returns the full file content, and `IO.write` writes data in one call.

```ruby
content = IO.read('notes.txt')
IO.write('copy.txt', content)
```