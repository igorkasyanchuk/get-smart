## ⏱️ Using around Hooks for Time Travel and Cleanup

`around` hooks offer precise control over setup and teardown, perfect for time-dependent tests or managing external resources. Encapsulate time travel and cleanup logic to ensure state consistency even when exceptions occur.

```ruby
RSpec.describe ReportGenerator do
  around(:each) do |example|
    Timecop.freeze(Time.local(2021, 12, 25)) do
      setup_test_database
      example.run
      cleanup_test_database
    end
  end

  it 'generates daily sales report for Christmas' do
    report = ReportGenerator.new.generate
    expect(report.date).to eq(Date.new(2021, 12, 25))
  end
end
```