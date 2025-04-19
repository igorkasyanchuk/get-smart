## 🔒 Scoped Refinements for Safe Monkey-Patching

Use `Module#refine` to limit monkey-patching surface and avoid global side effects. Bound refinements only apply when explicitly activated, ensuring safer, localized modifications to core classes.

```ruby
module StringEmojiRefinement
  refine String do
    def emojiize
      gsub(/:smile:/, '😄')
    end
  end
end

class Chat
  using StringEmojiRefinement

  def send(message)
    puts message.emojiize
  end
end

Chat.new.send('Hello :smile:')  # => Hello 😄
```