## 🔒 Use Signed and Encrypted Cookies

Rails provides signed and encrypted cookies to ensure data integrity and confidentiality. Signed cookies store data with a digital signature to detect tampering, while encrypted cookies add an extra layer of encryption. Use `cookies.signed` or `cookies.encrypted` to safely persist small user preferences or tokens.

```ruby
# Set a signed cookie for user_id
cookies.signed[:user_id] = { value: current_user.id, expires: 1.hour.from_now }

# Retrieve and verify
declared_user_id = cookies.signed[:user_id]
user = User.find_by(id: declared_user_id) if declared_user_id

# Set an encrypted cookie for a preference
cookies.encrypted[:theme] = { value: 'dark_mode', expires: 7.days.from_now }
theme = cookies.encrypted[:theme]
```