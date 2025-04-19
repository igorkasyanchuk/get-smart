## 🔍 Inspect Variables with puts and inspect

For simple and immediate feedback, use `puts` in combination with `inspect` inside your code. This prints output directly to the server console whenever that line is executed.

```ruby
def show
  @post = Post.find(params[:id])
  puts "Post details: #{@post.inspect}"
  # rest of action...
end
```
