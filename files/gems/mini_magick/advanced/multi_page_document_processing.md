## 📄 Process multi-page PDFs or TIFFs efficiently

MiniMagick allows selective page extraction and batch conversion from PDFs or multi-page TIFFs. Combine `density`, `format`, and page ranges to convert only needed pages at desired resolution without manual splitting.

```ruby
# Extract first 3 pages of a PDF at 300 DPI
image = MiniMagick::Image.open('document.pdf[0-2]')
image.density(300)
image.format('jpeg')
image.write('page_%d.jpg')

# Or use Convert tool for TIFF
MiniMagick::Tool::Convert.new do |convert|
  convert.density 150
  convert << 'source.tiff'
  convert << 'output_%d.png'
end
```
