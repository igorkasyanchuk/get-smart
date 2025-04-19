## 🚀 Efficient File Copy with IO.copy_stream
`IO.copy_stream` uses optimized system calls to copy data between IO objects or filenames. It’s much faster and simpler than manual loop-and-read approaches.

```ruby
source = 'backup/source.dat'
dest   = 'backup/dest.dat'
IO.copy_stream(source, dest)
```