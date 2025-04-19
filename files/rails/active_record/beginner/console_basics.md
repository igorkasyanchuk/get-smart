## 💡 Use the Rails Console

The Rails console is an interactive shell that lets you explore your application’s models, data, and methods. It’s the fastest way to test queries, instantiate objects, and debug logic without writing temporary scripts. To start, run the console in your project root and interact with Active Record models directly.

```ruby
$ rails console
irb(main):001:0> User.first
#<User id: 1, name: "Alice", email: "alice@example.com", created_at: "2023-01-01">  
```  
