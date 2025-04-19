## 🕵️ Use Mailer Previews for Safe Development

Rails Mailer Previews let you view email templates in the browser without sending real emails. Define previews under `test/mailers/previews` for quick iteration.

```ruby
# test/mailers/previews/user_mailer_preview.rb
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.first || User.new(name: 'Test', email: 'test@example.com')
    UserMailer.welcome_email(user)
  end
end
```

Visit `http://localhost:3000/rails/mailers/user_mailer/welcome_email` to inspect the email layout and content.