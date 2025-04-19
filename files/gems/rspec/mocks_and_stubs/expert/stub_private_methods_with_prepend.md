## 🔐 Stubbing Private Methods via `Module#prepend`

When you need to stub a private method without changing visibility, prepend a helper module to the singleton class. This allows you to override private behavior on a per‑instance basis for edge‑case tests.

```ruby
class Report
  def generate
    data = fetch_data
    process(data)
  end

  private

  def fetch_data
    # expensive DB calls
  end
end

RSpec.describe Report do
  it 'stubs private #fetch_data via prepend' do
    report = Report.new
    mod = Module.new do
      def fetch_data
        { foo: 'bar' }
      end
    end
    report.singleton_class.prepend(mod)

    allow(report).to receive(:process).with(foo: 'bar').and_return('processed')
    expect(report.generate).to eq('processed')
  end
end
```
