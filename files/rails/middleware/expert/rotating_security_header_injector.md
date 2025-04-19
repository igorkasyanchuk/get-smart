## 🔒 Rotating Security Header Injector

Enhance security by rotating Content-Security-Policy and other headers per request or per deploy, mitigating risk of long-lived static policies. This middleware pulls a list of CSP rules from `Rails.application.credentials` or a database, picks one based on a hash or timestamp, and injects it into the response. Combine this with HSTS, Referrer-Policy and Permissions-Policy for a layered defense.

```ruby
class RotatingSecurityHeaders
  def initialize(app)
    @app = app
    @policies = Rails.application.credentials.csp_policies || []
  end

  def call(env)
    status, headers, response = @app.call(env)
    policy = select_policy(env)
    headers['Content-Security-Policy'] = policy
    headers['Strict-Transport-Security'] = 'max-age=63072000; includeSubDomains'
    headers['Referrer-Policy'] = 'strict-origin-when-cross-origin'
    [status, headers, response]
  end

  private

  def select_policy(env)
    # Rotate by request IP, user ID, or timestamp
    idx = (env['REQUEST_PATH'].hash.abs % @policies.size)
    @policies[idx]
  end
end

# config/initializers/security_middleware.rb
Rails.application.config.middleware.insert_after ActionDispatch::SSL, RotatingSecurityHeaders
```