## 🔒 Locking Files with File#flock
Use `flock` to prevent race conditions when multiple processes access the same file. Shared lock (`LOCK_SH`) for reading; exclusive lock (`LOCK_EX`) for writing.

```ruby
File.open('shared.log', 'a') do |f|
  f.flock(File::LOCK_EX)
  f.puts("#{Time.now}: new entry")
  f.flock(File::LOCK_UN)
end
```