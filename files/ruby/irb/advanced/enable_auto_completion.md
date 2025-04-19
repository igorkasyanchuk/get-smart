## ⚙️ Enabling and Extending Auto-Completion

IRB can leverage Readline to offer tab-completion for methods, constants, and local variables. You can also inject your own completion candidates, such as project-specific keywords or custom commands.

```ruby
# ~/.irbrc
require 'irb/completion'
# Add custom completions
IRB.conf[:USE_READLINE] = true
Readline::HISTORY.push('my_custom_method')
Readline.completion_proc = proc do |s|
  (IRB.conf[:COMPLETE_METHODS] + ['TODO', 'FIXME']).grep(/^#{Regexp.escape(s)}/)
end
```