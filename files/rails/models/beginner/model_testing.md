## 🧪 Testing Models with RSpec

Write model specs to ensure validations, associations, and methods work as expected. Use factories and matchers for concise tests.

```ruby
# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should have_many(:posts).dependent(:destroy) }

  describe '#full_name' do
    it 'concatenates first and last name' do
      user = build(:user, first_name: 'Jane', last_name: 'Doe')
      expect(user.full_name).to eq('Jane Doe')
    end
  end
end
```