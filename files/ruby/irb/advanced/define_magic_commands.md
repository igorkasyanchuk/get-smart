## ✨ Defining Custom IRB Magic Commands

Magic commands let you invoke custom routines directly in IRB, similar to Pry’s commands. Use `IRB.conf[:MAGIC_WORDS]` to map a slash-command to a proc, making complex tasks one-liners.

```ruby
# ~/.irbrc
module IRB
  conf[:MAGIC_WORDS] ||= {}
  conf[:MAGIC_WORDS]['/reload!'] = proc do
    puts 'Reloading application...'
    load './config/environment.rb'
  end
end
# Then in IRB:
# /reload!
```