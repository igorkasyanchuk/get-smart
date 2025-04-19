## 🔄 Using `let` vs `let!` Effectively

Use `let` to lazily evaluate expensive setup only when needed, and `let!` to eagerly create data before each example. This prevents unnecessary database hits while ensuring critical records exist. Always prefer `let` for speed, and switch to `let!` if you're testing side effects or callbacks triggered at setup time.

```ruby
# Lazily created only when called
let(:user) { create(:user) }

it "doesn't hit the DB if not used" do
  expect(User.count).to eq(0)
end

# Eager creation ensures it's present before example
let!(:post) { create(:post, author: user) }

it "counts the post" do
  expect(Post.count).to eq(1)
end
```