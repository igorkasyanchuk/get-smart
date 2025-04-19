## ✂️ Transform Data with gsub and Blocks
Using `String#gsub` with a block gives you full control over replacements. You can compute dynamic values or apply logic based on each match.

```ruby
text = 'item1, item2, item3'
# Wrap each match in <span>
html = text.gsub(/item\d+/) do |match|
  "<span class='item'>#{match.upcase}</span>"
end
# => "<span class='item'>ITEM1</span>, ..."
```

Blocks shine when your replacements depend on the matched text rather than a static string.