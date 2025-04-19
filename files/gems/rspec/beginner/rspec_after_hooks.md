## 🧹 Cleaning Up with after Hooks

Use `after` hooks to perform cleanup tasks, like deleting temporary files or resetting configurations. This ensures each example runs in a clean state.

```ruby
RSpec.describe FileUploader do
  after(:each) do
    FileUtils.rm_rf('tmp/uploads')
  end

  it 'uploads a file' do
    uploader.upload('test.png')
    expect(Dir.exist?('tmp/uploads')).to be_truthy
  end
end
```
