## 🪶 Destructuring with Parallel Assignment
Ruby lets you assign multiple variables in one go from an array. Use the splat operator (`*`) to capture remaining elements into another array.

```ruby
info = ['Jane', 'Doe', 30, 'Engineer']

first_name, last_name, *details = info
# first_name => 'Jane'
# last_name  => 'Doe'
# details    => [30, 'Engineer']
```