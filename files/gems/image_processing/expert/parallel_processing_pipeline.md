## ⚡ Parallel Processing Pipeline

For CPU‑intensive pipelines (e.g., resizing multiple large images), you can fork subprocesses or use concurrent threads to fully utilize multi‑core systems. Ensure each subprocess initializes its own ImageMagick context to avoid thread‑safety issues.

```ruby
require "concurrent"
require "image_processing/mini_magick"

images = Dir["uploads/*.jpg"]

# Use Concurrent::Promises for a forking pool
futures = images.map do |path|
  Concurrent::Promises.future_on(Concurrent::FixedThreadPool.new(4)) do
    ImageProcessing::MiniMagick
      .source(path)
      .resize_to_limit(2000, 2000)
      .strip
      .quality(85)
      .call(destination: "processed/#{File.basename(path)}")
  end
end

# Wait for all tasks to finish
Concurrent::Promises.zip(*futures).value!
puts "All images processed in parallel"