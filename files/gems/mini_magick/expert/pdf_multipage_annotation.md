## 📄 Complex Multi-Page PDF Annotation and Extraction
Leverage MiniMagick’s page-level API to annotate each PDF page with dynamic headers or footers, then extract subregions for targeted exports. This approach automates watermarking, custom numbering, and selective cropping in large documents—ideal for batch report generation.

```ruby
require 'mini_magick'

pdf = MiniMagick::Image.open('source.pdf')
total = pdf.pages.count

pdf.pages.each_with_index do |page, idx|
  # Annotate header on each page
  page.combine_options do |cmd|
    cmd.density 300
    cmd.font 'Helvetica'
    cmd.pointsize 20
    cmd.draw "text 50,50 'Page #{idx+1} of #{total}'"
  end
  page.write("annotated_#{idx+1}.pdf")
end

# Recombine annotated pages
MiniMagick::Tool::Convert.new do |convert|
  Dir['annotated_*.pdf'].sort.each { |f| convert << f }
  convert << 'final_annotated.pdf'
end
```

You can also crop a signature box from page 3:

```ruby
signature = pdf.pages[2]
signature.crop '200x100+400+300'
signature.write('signature_crop.png')
```