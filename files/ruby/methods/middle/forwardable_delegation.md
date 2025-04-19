## 📦 Delegating Methods with the Forwardable Module

Instead of manually forwarding calls, Ruby's `Forwardable` module automates delegation, keeping your classes thin. Use `def_delegators` or `def_delegator` to specify which methods to forward to an internal object.

```ruby
require 'forwardable'

class Wrapper
  extend Forwardable
  def initialize(real)
    @real = real
  end
  def_delegators :@real, :perform, :status
end

class Worker
  def perform; 'done'; end
  def status; 'ok'; end
end

wrapper = Wrapper.new(Worker.new)
wrapper.perform  #=> "done"
wrapper.status   #=> "ok"
```