## 📖 Paginate Long Output
For large arrays or hashes, enable a pager so output scrolls in a `less` view. This prevents your terminal from flooding with too much text.

```ruby
# ~/.irbrc
require 'irb/pager'
IRB.conf[:PAGER] = 'less -R'
```