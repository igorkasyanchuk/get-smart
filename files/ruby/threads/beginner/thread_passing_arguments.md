## ➡️ Pass Arguments to Threads

You can pass arguments to the thread block so each thread can work on different data. This helps avoid sharing mutable state and reduces the need for synchronization.

```ruby
names = ['Alice', 'Bob', 'Carol']

threads = names.map do |name|
  Thread.new(name) do |n|
    puts "Hello from #{n}!"
    sleep rand(0.1..0.5)
    puts "#{n} done."
  end
end

threads.each(&:join)
```