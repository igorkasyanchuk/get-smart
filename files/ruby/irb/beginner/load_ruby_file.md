## 📂 Loading External Ruby Files

When you’re testing code from another file, use `load` to re-read it every time you change it. Unlike `require`, `load` will reload the file on each call, which is great for quick iterations:

```ruby
irb(main):001:0> load 'my_script.rb'
```

This executes `my_script.rb` in the current session so you can immediately test your updates.