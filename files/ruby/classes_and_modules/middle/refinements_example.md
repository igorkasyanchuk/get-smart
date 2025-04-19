## 🔒 Using Refinements for Scoped Monkey Patching

Refinements allow you to modify classes in a limited scope, avoiding global side effects. Activate them only where needed using `using` to maintain safer and clearer monkey patches.

```ruby
module StringRefinement
  refine String do
    def shout
      upcase + "!"
    end
  end
end

class LoudSpeaker
  using StringRefinement

  def announce(message)
    puts message.shout
  end
end

LoudSpeaker.new.announce("hello")
# => "HELLO!"
```