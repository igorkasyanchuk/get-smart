## 🧪 Enhanced Mailer Previews with Locales
Extend previews to test multiple locales and contexts. Iterate through `I18n.available_locales` in your preview classes for comprehensive QA.

```ruby
# test/mailers/previews/user_mailer_preview.rb
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.with(user: User.first).welcome_email
  end

  def all_locales
    I18n.available_locales.map do |locale|
      I18n.with_locale(locale) { welcome }
    end
  end
end
```