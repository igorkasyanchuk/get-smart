## 🚀 Pass arguments to shared_examples

You can parameterize your shared examples to test variations of behavior with different inputs. Pass arguments to `it_behaves_like` and reference them inside the shared block to make your specs more flexible.

```ruby
RSpec.shared_examples "a model with attribute" do |attribute|
  it "validates presence of #{attribute}" do
    subject.send("#{attribute}=", nil)
    expect(subject).not_to be_valid
    expect(subject.errors[attribute]).to include("can't be blank")
  end
end

RSpec.describe User do
  subject { described_class.new(password: "secret") }

  it_behaves_like "a model with attribute", :password
end
```
