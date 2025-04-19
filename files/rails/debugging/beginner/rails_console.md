## 🎛 Query and Debug in Rails Console

The Rails console lets you load your application environment and interact with models and methods. Use it to replicate and debug logic outside of a web request.

```bash
# start console
rails console

# example commands
user = User.find(1)
user.email = 'test@example.com'
user.save
```
