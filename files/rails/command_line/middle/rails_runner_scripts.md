## 🚀 Using Rails Runner for Ad-Hoc Scripts

Rails Runner lets you execute Ruby code in your app’s context without writing a full Rake task or script file. It’s perfect for one-off data fixes, bulk updates, or inspecting environments quickly.

```bash
# Print the total number of users
rails runner "puts User.count"

# Bulk-enable beta features for existing users
rails runner "User.where(beta: false).update_all(beta: true)"

# Load and run a script file in context
rails runner path/to/script/fix_dates.rb
```