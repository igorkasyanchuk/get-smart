## 🚀 Running Multiple IRB Sessions in One Process

IRB 1.3+ supports `--multi-irb` to spawn multiple consoles sharing the same VM. This allows you to inspect state in parallel contexts without reloading code.

```bash
# Launch a multi-IRB master console
irb --multi-irb
# In another terminal, attach a new session to the same VM
irb --multi-irb --attach=master
```