## 🧩 Parallel Zstd Compression via FFI

For maximum throughput, leverage Zstandard’s high-speed C library with custom FFI bindings and Ruby thread pools. This lets you compress multiple files in parallel while still streaming each file in chunks for low memory usage.

```ruby
require 'ffi'
require 'concurrent'

module Zstd
  extend FFI::Library
  ffi_lib 'libzstd'
  attach_function :ZSTD_createCStream, [], :pointer
  attach_function :ZSTD_initCStream, [:pointer, :int], :size_t
  attach_function :ZSTD_compressStream, [:pointer, :pointer, :pointer], :size_t
  attach_function :ZSTD_flushStream, [:pointer, :pointer], :size_t
  attach_function :ZSTD_freeCStream, [:pointer], :size_t

  class InOut < FFI::Struct
    layout :src, :pointer,
           :srcSize, :size_t,
           :dst, :pointer,
           :dstCapacity, :size_t,
           :dstSize, :size_t
  end
end

POOL = Concurrent::ThreadPoolExecutor.new(
  min_threads: 2,
  max_threads: Concurrent.processor_count,
  max_queue: 0 # unbounded
)

# Compress a single file in a background thread
def compress_zstd(input_path, output_path, level: 3, chunk_size: 16 * 1024)
  POOL.post do
    in_file = File.open(input_path, 'rb')
    out_file = File.open(output_path, 'wb')

    cstream = Zstd.ZSTD_createCStream()
    raise "Init error" if Zstd.ZSTD_initCStream(cstream, level) != 0

    io_struct = Zstd::InOut.new
    io_struct[:dstCapacity] = Zstd.lib.ZSTD_CStreamOutSize()
    io_struct[:dst] = FFI::MemoryPointer.new(:char, io_struct[:dstCapacity])

    while (data = in_file.read(chunk_size))
      io_struct[:src] = FFI::MemoryPointer.from_string(data)
      io_struct[:srcSize] = data.bytesize

      while io_struct[:srcSize] > 0
        ret = Zstd.ZSTD_compressStream(cstream, io_struct, io_struct)
        out_file.write(io_struct[:dst].read_string(io_struct[:dstSize]))
        io_struct[:src] = io_struct[:src] + (data.bytesize - io_struct[:srcSize])
      end
    end

    # Flush remaining data
    while Zstd.ZSTD_flushStream(cstream, io_struct) > 0
      out_file.write(io_struct[:dst].read_string(io_struct[:dstSize]))
    end

    Zstd.ZSTD_freeCStream(cstream)
    in_file.close
    out_file.close
  end
end

# Kick off parallel compression for multiple files
['video1.mp4', 'video2.mp4', 'large.db'].each do |file|
  compress_zstd(file, "#{file}.zst", level: 5)
end

POOL.shutdown
POOL.wait_for_termination
```

This pattern maximizes CPU utilization across cores and streams each file efficiently without high memory overhead.