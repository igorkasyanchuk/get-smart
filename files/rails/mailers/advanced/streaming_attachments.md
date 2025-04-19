## 📂 Streaming Large Attachments
For large attachments, use streaming to avoid loading the entire file into memory. Rails supports streaming attachments via `ActionMailer::Streaming`

```ruby
# app/mailers/report_mailer.rb
class ReportMailer < ApplicationMailer
  include ActionMailer::Streaming

  def monthly_report(user_id)
    @user = User.find(user_id)
    attachments.inline['report.pdf'] = {
      mime_type: 'application/pdf',
      content: lambda {
        PDFGenerator.generate_monthly_report(@user)
      }
    }
    mail(to: @user.email, subject: 'Your Monthly Report')
  end
end
```