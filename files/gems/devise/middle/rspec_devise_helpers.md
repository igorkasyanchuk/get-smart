## 🧪 Test Devise Authentication with RSpec Helpers

Devise ships with test helpers to simplify request specs. Include the `IntegrationHelpers` module and use `sign_in` and `sign_out` to authenticate users in your tests.

```ruby
# spec/rails_helper.rb
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
end

# spec/requests/profile_spec.rb
require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  it "returns the profile page" do
    get profile_path
    expect(response).to have_http_status(:ok)
  end
end
```