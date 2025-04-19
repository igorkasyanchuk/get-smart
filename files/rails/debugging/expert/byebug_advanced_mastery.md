## 🐞 Advanced Byebug Mastery

Byebug is more than just `binding.byebug`—you can define conditional breakpoints, navigate frames, and even create custom commands in your `.byebugrc`. This tip shows how to set up complex logic, manipulate variables at runtime, and script byebug to automate repetitive debugging tasks.

```ruby
# Place this in .byebugrc in your home directory
# Set breakpoint at UsersController#index only if current_user.admin?
break app/controllers/users_controller.rb:10 if current_user&.admin?

# Define a custom command to print relevant request info
defcmd req_info
environment[:request]&.inspect
end

# Automatically list local variables when hitting a breakpoint
display local_variables
```

Then in your controller:

```ruby
def index
  binding.byebug
  @users = User.all
end
```

Run the server, hit the route, and byebug will trigger with your scripted commands. Use `up`/`down` to move frames, `eval` to modify state, and `restart` to replay your session logic.