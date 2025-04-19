## 🚀 Atomic File Replacement with Tempfile

When you need to update a file without risking partial writes, create the Tempfile in the same directory as the target and rename it once everything is flushed. This guarantees atomic replacement: readers will either see the old or the new file, never a corrupt intermediate. Always `fsync` before renaming to force data to disk.

```ruby
require 'tempfile'
require 'fileutils'

target = '/var/app/config/settings.yml'

Tempfile.create(['settings', '.yml'], File.dirname(target)) do |tmp|
  tmp.write new_yaml_content
  tmp.flush            # push to OS buffers
  tmp.fsync            # push to disk
  tmp.close            # release the handle

  FileUtils.mv(tmp.path, target)  # atomic replace
end
```