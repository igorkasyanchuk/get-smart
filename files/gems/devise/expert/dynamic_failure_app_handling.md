## 🚨 Dynamic Devise::FailureApp for JSON and HTML Fallbacks
Customize `Devise::FailureApp` to intelligently redirect or render JSON error responses based on `Accept` headers or user roles. This allows APIs and web clients to share Devise authentication flows without duplicating controllers. Override `respond` and `route` methods to dispatch correctly.

```ruby
# lib/custom_failure.rb
class CustomFailure < Devise::FailureApp
  def respond
    if request.format.json?
      json_error
    else
      super
    end
  end

  def json_error
    self.status = :unauthorized
    self.content_type = 'application/json'
    self.response_body = { error: i18n_message }.to_json
  end
end

# config/initializers/devise.rb
Devise.setup do |config|
  config.warden do |manager|
    manager.failure_app = CustomFailure
  end
end
```