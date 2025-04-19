## 🌐 Match Unicode Properties
Leverage `\p{...}` to match Unicode categories, scripts, and blocks. You can detect emojis, scripts like Hiragana or Arabic, and more, without manual ranges.

```ruby
text = "こんにちは世界🌍"
# Match Hiragana characters
hiragana = text.scan(/\p{Hiragana}+/)
#=> ["こんにちは"]
# Match any emoji
emojis = text.scan(/\p{Emoji}/)
#=> ["🌍"]
```