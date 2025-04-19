## 💾 Enable Persistent History
By default, IRB doesn’t remember your commands between sessions. You can enable history persistence by configuring the history file path and maximum entries in your `~/.irbrc` so you can search past commands later.

```ruby
# ~/.irbrc
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY]   = 1000  # keep last 1000 commands
```