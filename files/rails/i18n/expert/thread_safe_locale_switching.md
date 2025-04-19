## ⚙️ Thread-Safe Dynamic Locale Switching
On multi‑threaded servers (Puma/Unicorn), set per‑request locale without leaking it across threads. Use an `around_action` to wrap requests, falling back to the default locale in `ensure`.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

  def switch_locale(&action)
    locale = params[:locale] || request.headers['Accept-Language']&.scan(/^[a-z]{2}/)&.first
    I18n.with_locale(locale || I18n.default_locale, &action)
  end
end
```

This approach uses `I18n.with_locale`, which is thread-safe and guarantees the locale resets after the block, avoiding bleed into other requests.