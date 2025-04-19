## 🚀 Streaming and Pipelining Large Image Transformations
For memory‑constrained environments, avoid temporary files by streaming image data between MiniMagick and other CLI tools. Piping via STDIN/STDOUT maintains a constant memory footprint regardless of image size, enabling true real‑time processing in high‑throughput systems.

```ruby
require 'open3'
require 'mini_magick'

# Assemble a Convert command that reads JPEG from STDIN and outputs PNG to STDOUT
tool = MiniMagick::Tool::Convert.new do |c|
  c << 'jpeg:-'       # read JPEG from STDIN
  c.resize '1024x'    # resize operation
  c << 'png:-'        # write PNG to STDOUT
end
convert_cmd = tool.args

# Stream the data
to_stdin = File.binread('large_input.jpg')
stdout_str, stderr_str, status = Open3.capture3(*convert_cmd, stdin_data: to_stdin)

# Load the transformed image directly from stdout
processed = MiniMagick::Image.read(stdout_str) do |img|
  img.format 'png'
end
processed.write('resized.png')
```