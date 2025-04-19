## 📐 Dynamic Multipart Emails with Variants

Build HTML/text emails with on‑the‑fly content variants and inline attachments. Use Rails 6+ variants to generate responsive images or localized screenshots.

```ruby
# app/mailers/report_mailer.rb
class ReportMailer < ApplicationMailer
  def weekly_summary(user)
    attachments.inline["chart.png"] = generate_chart(user).variant(resize: "600x300").processed.blob

    mail(
      to: user.email,
      subject: "Your Weekly Summary",
      template_path: "report_mailer",
      template_name: user.premium? ? "premium" : "standard"
    )
  end
end

# app/views/report_mailer/premium.html.erb
<img src="cid:chart.png" alt="Weekly Chart" />
<p>Premium features included...</p>
```

Variants let you tweak attachments without pre‑processing, and dynamic `template_name` switches layouts effortlessly.