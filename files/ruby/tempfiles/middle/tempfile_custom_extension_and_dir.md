## 🛠️ Customize Tempfile Extensions and Directories

You can pass a name array and directory path to `Tempfile.new` to set a meaningful extension and storage location. Combining this with `binmode` is essential when handling binary data, such as images or encrypted blobs.

```ruby
require 'tempfile'

tmp_dir = "/custom/tmp"
tempfile = Tempfile.new(['image_upload', '.png'], tmp_dir, encoding: 'ascii-8bit')
tempfile.binmode  # ensure binary-safe writes

tempfile.write(File.read('source.png', mode: 'rb'))
# Process your binary data...

tempfile.close
tempfile.unlink  # explicitly delete when done
```