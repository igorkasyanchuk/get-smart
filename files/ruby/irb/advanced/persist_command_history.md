## 📜 Persisting Command History Across Sessions

By default IRB saves only the last 100 lines of history per session. You can configure it to store thousands of commands and merge with existing history on startup. This makes recalling previous explorations a breeze.

```ruby
# ~/.irbrc
require 'irb/ext/save-history'
IRB.conf[:HISTORY_FILE] = "~/.irb_history"
IRB.conf[:SAVE_HISTORY] = 5_000  # keep last 5000 commands
IRB.conf[:AUTO_SAVE_HISTORY] = true
```