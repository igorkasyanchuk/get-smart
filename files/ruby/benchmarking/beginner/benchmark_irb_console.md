## ⚡ Quick Performance Checks in IRB or Rails Console

You can use `Benchmark` directly in IRB or `rails console` for fast, interactive profiling. Just `require 'benchmark'`, paste your code block, and inspect results immediately.

```bash
$ irb
>> require 'benchmark'
>> Benchmark.measure { (1..100_000).map(&:to_s) }
=>   0.020000   0.000000   0.020000 (  0.019845)
```