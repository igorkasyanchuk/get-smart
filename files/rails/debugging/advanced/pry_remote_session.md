## 🐞 Attach a Remote Pry Session
Using the `pry-remote` gem allows you to drop into a Pry session on a remote Rails process, ideal for debugging jobs or background workers. You can inject `binding.remote_pry` at any line, then connect over TCP to examine state, step through code, or modify variables in real time.

```ruby
# Gemfile
gem 'pry-remote', group: :development

# in your code or job
def perform(*args)
  # …before the problematic code
  binding.remote_pry
  # …continue execution after attaching
end
```

Then run:

```bash
telnet localhost 9876
```