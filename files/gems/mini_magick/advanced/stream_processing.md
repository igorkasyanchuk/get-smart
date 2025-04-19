## 🖼️ Stream image processing with MiniMagick::Tool

By leveraging MiniMagick::Tool and piping image data through STDIN/STDOUT, you can avoid temp files and reduce disk I/O. This approach is ideal for high-performance servers or background jobs that process large batches of images without cluttering the filesystem.

```ruby
MiniMagick::Tool::Convert.new do |convert|
  convert << '-'                  # read from STDIN
  convert.resize '800x600'
  convert.quality '85'
  convert << '-'                  # write to STDOUT
end
```
