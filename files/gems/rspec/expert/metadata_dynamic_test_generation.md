## 🔖 Generate Specs Dynamically via Metadata
Use metadata-driven iteration to generate boundary tests or permutations without boilerplate. Combine RSpec's metadata filtering and example groups to create dynamic contexts on the fly.

```ruby
RSpec.shared_examples 'validates range' do |min, max|
  it "accepts value at boundary #{min}" do
    expect(subject.validate(min)).to be_truthy
  end

  it "rejects value below #{min}" do
    expect(subject.validate(min - 1)).to be_falsey
  end
end

RSpec.describe RangeValidator do
  [{min: 0, max: 10}, {min: -5, max: 5}].each do |bounds|
    context "with bounds #{bounds}" do
      subject { described_class.new(bounds[:min], bounds[:max]) }
      include_examples 'validates range', bounds[:min], bounds[:max]
    end
  end
end
```