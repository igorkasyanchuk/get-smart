## 📝 Dynamic Subjects with I18n Interpolation
Use Rails’ built‑in I18n to craft dynamic, localized email subjects. This pattern keeps your mailer DRY and ready for multi-language applications.

```yml
# config/locales/en.yml
en:
  mailers:
    user_mailer:
      greeting_subject: "Hello %{user_name}, welcome to %{app_name}!"
```

```ruby
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  def greeting(user)
    @user = user
    subject = I18n.t(
      'mailers.user_mailer.greeting_subject',
      user_name: @user.name,
      app_name: Rails.application.class.module_parent_name
    )
    mail(to: @user.email, subject: subject)
  end
end
```