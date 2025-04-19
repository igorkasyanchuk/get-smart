## 🎨 Composite images with alpha masks and custom blending

Use advanced ImageMagick compose operators to blend layers with precision. By loading a mask and specifying `Dst_In` compose mode with an alpha channel, you can apply non-destructive masking for complex visual effects.

```ruby
mask  = MiniMagick::Image.open('mask.png')
base  = MiniMagick::Image.open('base.jpg')
result = base.composite(mask) do |c|
  c.compose 'Dst_In'    # keep only masked area
  c.alpha   'set'       # ensure alpha channel is enabled
  c.gravity 'center'
end
result.write('masked.png')
```
