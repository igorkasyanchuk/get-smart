## ⌨️ Creating Custom Readline Key Bindings

Define your own key bindings in IRB to speed up navigation, snippet insertion, or even macro execution. Leverage Readline’s `parse_and_bind` feature to tie keys to commands.

```ruby
# ~/.irbrc
require 'readline'
# Bind Ctrl+L to clear the screen
Readline.parse_and_bind('Control-l: clear-screen')
# Bind Alt+I to insert a code snippet
Readline::HISTORY.push 'def snippet; puts "Hello"; end'
```