## 🔍 Advanced Incremental History Search
Leverage Readline's incremental search to quickly find previous commands without leaving IRB. By binding `Ctrl-R` to `history_search_backward`, you can jump directly to matching entries.

Add this to your `~/.irbrc`:

```ruby
require 'readline'
Readline.define_history_proc { |line| line.strip.empty? ? false : true }
Readline.emacs_editing_mode
Readline::HISTORY.to_a      # inspect history
# Bind Ctrl-R to reverse incremental search
Readline.rl_bind_key("\C-r") { Readline::history_search_backward }
```

Now within IRB, hit `Ctrl-R` and type part of a previous command to instantly recall it.