## 🖥️ Parameterized Mailer Previews with Locales

Enhance `ActionMailer::Preview` by passing dynamic parameters and locale overrides. This helps stakeholders preview emails in different contexts without code changes.

```ruby
# test/mailers/previews/user_mailer_preview.rb
class UserMailerPreview < ActionMailer::Preview
  # GET /rails/mailers/user_mailer/welcome?user_id=5&locale=es
  def welcome
    I18n.with_locale(params[:locale] || :en) do
      user = User.find(params[:user_id] || User.first.id)
      UserMailer.with(user: user).welcome_email
    end
  end
end
```

Navigate to `/rails/mailers/user_mailer/welcome?user_id=42&locale=fr` to verify localized content and bank‑level personalization.