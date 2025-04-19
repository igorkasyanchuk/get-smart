## 🧹 Use `after` Hooks for Cleanup

`after` hooks run code after each example completes, making them perfect for cleaning up external resources or resetting shared state. Use them to tear down any setup to avoid side effects between examples.

```ruby
RSpec.describe FileUploader do
  before(:each) do
    @tempfile = Tempfile.new('upload')
  end

  after(:each) do
    @tempfile.close
    @tempfile.unlink
  end

  it 'writes data to the file' do
    uploader = FileUploader.new(@tempfile.path)
    uploader.upload('data')
    expect(File.read(@tempfile.path)).to eq('data')
  end
end
```
