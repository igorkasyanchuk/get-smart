## 📦 Creating Tar.gz Archives with Archive::Tar::Minitar and Zlib

To bundle multiple files or directories into a single compressed archive while preserving permissions and metadata, combine `Archive::Tar::Minitar` with `Zlib::GzipWriter`. This allows you to stream‑create a `.tar.gz` with minimal disk I/O and no intermediate archive file on disk.

```ruby
require 'zlib'
require 'archive/tar/minitar'
include Archive::Tar

sources = ['dir1', 'file2.txt', 'dir3']
output = 'archive_bundle.tar.gz'

Zlib::GzipWriter.open(output, Zlib::BEST_COMPRESSION) do |gzip|
  Minitar::Writer.open(gzip) do |tar|
    sources.each do |path|
      if File.directory?(path)
        Minitar.pack_dir(path, tar)
      else
        Minitar.pack_file(path, tar)
      end
    end
  end
end
```

To extract, reverse the process using `Zlib::GzipReader` piped into `Minitar::Reader.unpack`, enabling advanced Ruby apps to manage archives entirely in memory or over network streams.