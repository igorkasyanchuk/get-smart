## 🖼 Customize the Inspector
Adjust IRB’s built‑in inspector to use pretty or colored output. This improves readability without external gems.

```ruby
# ~/.irbrc
IRB.conf[:INSPECT_MODE] = :pretty    # uses PrettyPrint (pretty_inspect)
IRB.conf[:ECHO]         = true       # show evaluated code
```