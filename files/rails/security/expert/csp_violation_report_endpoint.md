## 📣 CSP Violation Logging Endpoint
Collect CSP violation reports in your own system for forensic analysis. Log each incoming JSON report to Sentry or your SIEM, and monitor attack patterns.

```ruby
# app/controllers/csp_reports_controller.rb
class CspReportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    report = JSON.parse(request.body.read)
    Rails.logger.warn("CSP Violation: ", report)
    head :no_content
  end
end

# config/routes.rb
post '/csp-violation-report' => 'csp_reports#create'
```

```ruby
# config/initializers/content_security_policy_report.rb
Rails.application.config.content_security_policy_report_only = true
Rails.application.config.content_security_policy_report_uri "/csp-violation-report"
```