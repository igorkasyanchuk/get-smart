## 🛠️ Initialize a Mutex for Each Resource

For multiple shared resources, create one `Mutex` per resource to avoid unnecessary blocking. This lets threads work in parallel when they're accessing different data.

```ruby
require 'thread'

class BankAccount
  def initialize(balance)
    @balance = balance
    @mutex = Mutex.new
  end

  def deposit(amount)
    @mutex.synchronize do
      @balance += amount
    end
  end

  def balance
    @mutex.synchronize { @balance }
  end
end

account1 = BankAccount.new(100)
account2 = BankAccount.new(200)

# Threads can deposit into different accounts concurrently without blocking each other
a = Thread.new { account1.deposit(50) }
b = Thread.new { account2.deposit(75) }
a.join; b.join
puts account1.balance  # => 150
puts account2.balance  # => 275
```