## 🎨 Customize the Prompt
A custom prompt can convey context like the current directory or Git branch. Define a new prompt mode in your `~/.irbrc` and switch to it for a tailored REPL experience.

```ruby
# ~/.irbrc
IRB.conf[:PROMPT][:MIDDLE] = {
  PROMPT_I: "\033[1;32m>> \033[0m",   # main prompt
  PROMPT_S: "\033[1;33m?  \033[0m",   # continued string
  PROMPT_C: "\033[1;31m*  \033[0m",   # continued expression
  RETURN:   "=> %s\n"                # return value
}
IRB.conf[:PROMPT_MODE] = :MIDDLE
```