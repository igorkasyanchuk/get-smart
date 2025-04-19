## 🐢 Quick script profiling with --profile flag

Rubys `--profile` flag gives you a simple flat profile of every method call in your script. This is the quickest way to get a high-level overview of where your code spends time.

```bash
ruby --profile my_script.rb
```

At the end of execution youll see a table listing total calls, total time, and percent time for each method.