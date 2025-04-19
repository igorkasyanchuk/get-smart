## 🏁 Whitelisted Safe Redirects
Open redirect vulnerabilities let attackers phish your users by redirecting to malicious domains. Always verify that any dynamic `redirect_to` target is on your approved list or a local path.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :verify_safe_redirect, only: :redirect_action

  private

  def redirect_action
    redirect_to params[:next]
  end

  def verify_safe_redirect
    uri = URI.parse(params[:next].to_s)
    hosts = ['your-trusted-site.com', request.host]

    unless (uri.host.nil? && uri.path.start_with?('/')) || hosts.include?(uri.host)
      render status: :forbidden, plain: 'Unsafe redirect blocked'
    end
  rescue URI::InvalidURIError
    head :bad_request
  end
end
```
