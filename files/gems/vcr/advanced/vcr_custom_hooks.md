## 🛠️ Custom Hooks for Request and Response Manipulation

VCR allows you to hook into the recording process to filter sensitive data or modify requests and responses on the fly. You can use `before_record`, `before_playback`, and `after_http_request` hooks to sanitize API keys, mask personal information, or inject headers dynamically. This is especially useful when dealing with third‑party services that return volatile tokens or PII.

```ruby
VCR.configure do |c|
  # Filter out API keys in URIs and headers
  c.filter_sensitive_data('<API_KEY>') { ENV['THIRD_PARTY_API_KEY'] }

  # Strip dynamic tokens from recorded responses
  c.before_record do |interaction|
    interaction.response.body.gsub!(/"token":"[^"]+"/, '"token":"<TOKEN>"')
  end

  # Inject a custom header before playback
  c.before_playback do |interaction|
    interaction.request.headers['X-Test-Mode'] = ['true']
  end
end
```