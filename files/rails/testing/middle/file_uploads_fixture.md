## 📁 Testing File Uploads with `fixture_file_upload`

Use Rails’ built‑in `fixture_file_upload` helper to attach files in request or controller specs. Store test files under `spec/fixtures/files` and pass the fixture to your params.

```ruby
# spec/requests/avatars_spec.rb
describe 'POST /users/:id/avatar', type: :request do
  let(:user) { create(:user) }
  let(:file) { fixture_file_upload('files/avatar.png', 'image/png') }

  it 'uploads an avatar successfully' do
    post user_avatar_path(user), params: { avatar: file }
    expect(response).to have_http_status(:created)
    user.reload
    expect(user.avatar).to be_attached
  end
end
```
