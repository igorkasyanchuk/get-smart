## 💾 Persisting Command History

By default, IRB saves your history between sessions if you enable it in `~/.irbrc`. Add the following to your `.irbrc` to keep the last 1000 commands:

```ruby
# ~/.irbrc
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "~/.irb_history"
```

Now every command you run will be saved across sessions.