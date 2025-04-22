## 🗜️ Create a Zip Archive with Rubyzip

The `rubyzip` gem lets you bundle multiple files into a single ZIP. First install it with `gem install rubyzip`. Then open a `Zip::File` and add files one by one.

```ruby
require 'zip'

files_to_zip = ['file1.txt', 'file2.txt']
output_zip  = 'archive.zip'

Zip::File.open(output_zip, Zip::File::CREATE) do |zipfile|
  files_to_zip.each do |filename|
    zipfile.add(File.basename(filename), filename)
  end
end
```
