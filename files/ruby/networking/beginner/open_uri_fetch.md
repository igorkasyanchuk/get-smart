## 📖 Fetching URLs with open-uri

The `open-uri` library lets you treat HTTP(S) URLs like files, making quick scripts to download or read remote content easy. It's ideal for one-liners or small utilities. Here's how to read and print the HTML of a web page in just a few lines.

```ruby
require 'open-uri'

url = 'https://www.ruby-lang.org/en/'
html = URI.open(url).read
puts html[0..200]  # Print first 200 characters
```