## 🚀 Streaming Chunked Gzip Compression

When compressing very large files, loading the entire file into memory can lead to OOM errors. By streaming chunks through `Zlib::GzipWriter`, you can compress data on-the-fly with constant memory usage. This also lets you tune the compression level and Gzip header metadata for finer control.

```ruby
require 'zlib'

CHUNK_SIZE = 16 * 1024  # 16KB per chunk

def compress_stream(input_path, output_path, level: Zlib::BEST_COMPRESSION)
  File.open(input_path, 'rb') do |infile|
    File.open(output_path, 'wb') do |outfile|
      gz = Zlib::GzipWriter.new(outfile, level)
      # Customize Gzip header
      gz.orig_name = File.basename(input_path)
      gz.mtime = File.mtime(input_path).to_i

      while (chunk = infile.read(CHUNK_SIZE))
        gz.write(chunk)
      end

      gz.close
    end
  end
end

# Usage:
compress_stream('huge_video.mp4', 'huge_video.mp4.gz')
```

Tip: Use `CHUNK_SIZE` in powers of two to align with disk block sizes. Increasing `level` improves compression ratio at cost of CPU, so benchmark for your hardware.