## 🔧 Define Custom IRB Commands
Extend IRB with your own commands for repetitive tasks. Here’s how to add a `my_ls` command that lists directory contents.

```ruby
# ~/.irbrc
module IRB::ExtendCommandBundle
  def my_ls(path = '.')
    puts Dir.entries(path)
  end
end
```
Now inside IRB call `my_ls 'lib'` to quickly inspect files.