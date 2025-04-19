## 📎 Add Attachments and Inline Images

Attach files or embed images directly in the email body. Inline images improve branding and style consistency in HTML emails.

```ruby
class InvoiceMailer < ApplicationMailer
  def invoice_email(invoice)
    @invoice = invoice
    attachments['invoice.pdf'] = File.read(invoice.pdf_path)
    attachments.inline['logo.png'] = File.read(Rails.root.join('app/assets/images/logo.png'))
    mail(to: @invoice.user.email, subject: 'Your Invoice')
  end
end
```

```erb
<!-- app/views/invoice_mailer/invoice_email.html.erb -->
<p>Thank you for your business!</p>
<img src="cid:logo.png" alt="Company Logo">
```