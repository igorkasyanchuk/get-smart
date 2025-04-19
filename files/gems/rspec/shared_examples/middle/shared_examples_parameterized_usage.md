## ⚙️ Parameterize shared_examples with parameters

Use block arguments in `shared_examples` to pass different contexts or scopes, avoiding duplication when testing similar behavior with varying inputs. This pattern simplifies adding new cases without rewriting the example group.

```ruby
# spec/support/shared_examples/filterable.rb
RSpec.shared_examples "filterable model" do |scope_name|
  let!(:matching_records) { create_list(:user, 2, scope_name => true) }
  let!(:non_matching_records) { create_list(:user, 2, scope_name => false) }

  it "returns only records where #{scope_name} is true" do
    expect(described_class.send(scope_name)).to match_array(matching_records)
  end
end

# spec/models/user_spec.rb
RSpec.describe User, type: :model do
  it_behaves_like "filterable model", :active
  it_behaves_like "filterable model", :verified
end
```
