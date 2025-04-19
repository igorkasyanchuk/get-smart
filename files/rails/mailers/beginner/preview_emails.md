## 👀 Previewing Emails in Development

Rails Mailer Previews let you view email templates in the browser without sending real emails. Create a preview class under `test/mailers/previews/`.

```ruby
# test/mailers/previews/user_mailer_preview.rb
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.first || User.new(name: 'Test', email: 'test@example.com')
    UserMailer.welcome_email(user)
  end
end
```

Start your server and navigate to `http://localhost:3000/rails/mailers/user_mailer/welcome_email` to see the HTML and text previews.