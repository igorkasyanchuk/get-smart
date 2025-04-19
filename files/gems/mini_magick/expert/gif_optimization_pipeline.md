## 🌀 Advanced GIF Optimization Pipeline
Use ffmpeg to generate a tailored color palette and stream it into MiniMagick’s Convert to produce an optimized, high-fidelity GIF. This two-pass workflow drastically reduces file size while maintaining color accuracy for complex animations. You can script both steps in Ruby to integrate seamlessly into your pipeline.

```bash
# 1. Extract optimal palette from video
ffmpeg -v warning -i input.mp4 -vf fps=15,scale=640:-1:flags=lanczos,palettegen palette.png
```

```ruby
require 'mini_magick'

# 2. Create optimized GIF using the generated palette
i = MiniMagick::Tool::Convert.new do |convert|
  convert << '-i' << 'input.mp4'
  convert << '-i' << 'palette.png'
  convert << '-lavfi' << 'fps=15,scale=640:-1:flags=lanczos[x];[x][1:v]paletteuse'
  convert << '-loop' << '0'
  convert << 'optimized.gif'
end
```
