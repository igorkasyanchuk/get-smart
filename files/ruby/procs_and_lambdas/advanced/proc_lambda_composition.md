## ⚙️ Composing Procs and Lambdas
Build complex transformations by composing smaller procs. Define a helper to chain functions, leading to readable, pipeline-like code and easier testing of each stage.

```ruby
def compose(*fns)
  ->(input) { fns.reduce(input) { |memo, fn| fn.call(memo) } }
end

upcase = ->(s) { s.upcase }
exclaim = ->(s) { "#{s}!" }

shout = compose(upcase, exclaim)
puts shout.call("hello world")  # => "HELLO WORLD!"
```