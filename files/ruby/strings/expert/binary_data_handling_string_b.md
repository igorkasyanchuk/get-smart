## 🛠 Optimize binary data handling with String#b

Ruby strings carry an associated encoding, which can lead to unwanted transcoding when working with raw bytes. Appending `.b` returns a binary-encoded copy (`ASCII-8BIT`), bypassing Ruby’s default UTF-8 checks. This is indispensable when interfacing with C extensions or handling packed protocol frames.

```ruby
data = File.read("image.png")       # => UTF-8 or ASCII-8BIT depending on source
binary = data.b                      # force ASCII-8BIT
puts binary.encoding                # => #<Encoding:ASCII-8BIT>
# Now you can safely manipulate `binary` without encoding transcoding
```