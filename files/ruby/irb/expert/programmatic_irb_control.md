## ⚙️ Programmatic IRB Session Control
Embed IRB sessions in your scripts and control their lifecycle. This is essential for building custom consoles or REPL-based tools.

```ruby
require 'irb'
require 'irb/ext/multi-irb'

thread1 = Thread.new do
  IRB.start(__FILE__, binding)
end
thread2 = Thread.new do
  IRB.start(__FILE__, TOPLEVEL_BINDING)
end

[thread1, thread2].each(&:join)
```

Here, two IRB sessions run concurrently in separate threads. You can programmatically start, stop, or broadcast code to them by leveraging `IRB.CurrentContext`.