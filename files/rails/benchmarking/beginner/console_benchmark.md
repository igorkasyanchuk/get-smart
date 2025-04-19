## 🖥️ Try Benchmarking in Rails Console

You can experiment with benchmarking interactively in the Rails console. Require the `benchmark` library and run measurements on-the-fly to experiment with performance tweaks.

```bash
$ rails console
Loading development environment (Rails 6.1.4)
irb(main):001:0> require 'benchmark'
=> true
irb(main):002:0> Benchmark.measure { Order.create(name: 'Test') }
=>   user     system      total        real
=>  0.001000   0.000000   0.001000 (  0.001234)
```
