## 🕳️ Create and Manage Sparse Files via FFI or `truncate`
Sparse files let you allocate large logical sizes without consuming physical disk blocks. Use `File#truncate` or `lseek` with `SEEK_DATA`/`SEEK_HOLE` (Linux/Mac) for advanced sparse manipulation.

```ruby
file = File.open('sparse.bin', 'wb+')
# Create a 10GB sparse file
file.truncate(10 * 1024**3)

# Write a small header
file.seek(0)
file.write("HEADER")

# Seek to offset and write footer
file.seek(9 * 1024**3)
file.write("FOOTER")
file.close

# Inspect holes and data extents (via FFI)
# Use `lseek(fd, offset, SEEK_DATA)` and `SEEK_HOLE` to discover blocks
```

Sparse files are ideal for VM disk images or huge file placeholders without paying the full storage cost.