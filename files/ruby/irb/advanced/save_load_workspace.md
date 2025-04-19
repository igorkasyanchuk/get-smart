## 💾 Saving and Restoring IRB Workspaces

Persist your session’s workspace variables and reload them later to pick up right where you left off. Use `IRB.conf[:SAVE_WORKSPACE]` and `IRB.load` to serialize and deserialize your session.

```ruby
# ~/.irbrc
IRB.conf[:SAVE_WORKSPACE] = true
IRB.conf[:WORKSPACE_FILE] = "~/.irb_workspace"
# Then at exit:
# IRB.save_workspace
# At start:
# IRB.load_workspace
```