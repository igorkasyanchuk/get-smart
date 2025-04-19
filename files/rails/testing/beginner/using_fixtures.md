## 📂 Using Fixtures for Simple Data

Rails fixtures let you preload data for tests without repeatedly creating it in each spec. Define fixture files under `test/fixtures` and enable fixture support in RSpec.

```yaml
# test/fixtures/users.yml
default:
  name: "Test User"
  email: "user@example.com"
```

In your spec helper (`spec/rails_helper.rb`), add:

```ruby
config.fixture_path = Rails.root.join('test', 'fixtures')
config.use_transactional_fixtures = true
```

Then in a spec:

```ruby
RSpec.describe User, type: :model do
  fixtures :users

  it 'loads the default fixture' do
    user = users(:default)
    expect(user.email).to eq('user@example.com')
  end
end
```