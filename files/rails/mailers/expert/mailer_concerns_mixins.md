## 🧩 Extracting Reusable Mailer Concerns

Encapsulate shared logic—like footers, localization, logging—into mailer concerns. This maintains dry mailers and simplifies changes across multiple mailers.

```ruby
# app/mailers/concerns/signature_concern.rb
module SignatureConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_signature
  end

  private

  def set_signature
    @signature = current_organization.email_signature
  end
end

# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  include SignatureConcern
  default from: -> { "#{current_organization.name} <no-reply@#{current_organization.domain}>" }
end

# app/views/user_mailer/welcome.html.erb
<p>Welcome!</p>
<p><%= @signature %></p>
```

Concerns avoid duplication and let you compose behaviors via `include` or `prepend`.