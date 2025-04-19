## 🚀 Dynamic Git-Aware Prompt
Display branch, status and timing in your IRB prompt to stay context-aware. By customizing `IRB.conf[:PROMPT]`, you can show Git information inline.

```ruby
require 'irb'
require 'open3'

IRB.conf[:PROMPT][:GIT] = {
  PROMPT_I: "#{`git rev-parse --abbrev-ref HEAD`.strip} %03n:%i> ",
  PROMPT_S: nil,
  PROMPT_C: nil,
  RETURN: "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :GIT
```

This runs on each prompt, fetching the current branch. You can extend the shell call to show dirty state via `git status --porcelain`.