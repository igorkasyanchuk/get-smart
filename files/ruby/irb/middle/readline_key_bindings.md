## 🔑 Customize Readline Key Bindings
Improve history navigation by binding arrow keys to prefix searches. This allows you to type part of a command and hit ↑/↓ to cycle through matching history entries.

```ruby
# ~/.irbrc
require 'readline'
Readline.rl_parse_and_bind('"\e[A": history-search-backward')
Readline.rl_parse_and_bind('"\e[B": history-search-forward')
```