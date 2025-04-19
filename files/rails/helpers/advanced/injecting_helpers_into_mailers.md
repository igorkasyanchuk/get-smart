## 📧 Injecting View Helpers into Mailers

Include view helper modules in mailers to reuse formatting, URL helpers, or UI components directly within email templates. This ensures consistency between your web views and email content.

```ruby
# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  helper ApplicationHelper
  helper PostsHelper
  default from: 'notifications@example.com'
end

# app/views/user_mailer/welcome_email.html.erb
<%= card_for(@user) do %>
  <p>Welcome to our platform, <%= @user.name %>!</p>
<% end %>
```
