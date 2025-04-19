## 📭 Generating a Mailer

Rails provides a generator to quickly scaffold a new mailer including the class and view folders. You can run the following command to create a mailer named `UserMailer` and a corresponding directory for its email templates.

```bash
# Generate a mailer with default views
rails generate mailer UserMailer
```

This creates `app/mailers/user_mailer.rb` and `app/views/user_mailer/` with empty template files. You can then define email methods in the generated class and create matching `.html.erb` or `.text.erb` templates.