## 💻 Running Shell Commands with `!`

Prefix commands with `!` to run shell commands without leaving IRB. This is handy for checking files or directory contents on the fly:

```ruby
irb(main):001:0> !pwd
/home/user/projects
irb(main):002:0> !ls -al
```

The output appears right in your IRB session.