## 🛠️ Update Records with `update` and `assign_attributes`

Updating records is simple: call `update` on an instance or chain it on the class. For more control, use `assign_attributes` then `save`. This lets you validate or modify fields before persisting.

```ruby
user = User.find(1)
# Updates and saves in one step (returns boolean)
user.update(name: 'Bob')

# Assign without saving
user.assign_attributes(email: 'bob@example.com')
user.save # returns true/false depending on validations
```  
