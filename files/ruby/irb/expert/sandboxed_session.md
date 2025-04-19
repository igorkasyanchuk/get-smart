## 🛡️ Sandboxed IRB with Safe Levels
Run untrusted code or plugins within a restricted IRB session by leveraging Ruby's `$SAFE` levels (MRI ≤2.6) or `Sandbox` gems for modern versions.

```ruby
require 'sandbox'
sb = Sandbox.new
sb.eval('File.write("/tmp/hacked", "oops")')    # blocked by sandbox
sb.eval('2 + 2')                                    # => 4

# For MRI ≤2.6, you can also:
Thread.new do
  $SAFE = 3
  eval("File.read('/etc/passwd')")               # raises SecurityError
end.join
```

This isolates evaluation contexts, preventing file system or system call escapes. Use it when loading third‑party IRB extensions.