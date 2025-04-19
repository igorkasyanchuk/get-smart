## 🎯 Deep Customization of Request Matching and Hooks

When working with complex APIs, default request matching can fail—especially when dynamic query params or timestamps are involved. You can define **custom request matchers** and leverage `before_record`/`before_playback` hooks to normalize or scrub volatile data, ensuring your cassettes remain stable across runs.

```ruby
# spec/support/vcr.rb
VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr_cassettes"
  c.hook_into :webmock

  # Custom matcher that ignores dynamic timestamp query params
  c.register_request_matcher :uri_without_timestamp do |request_1, request_2|
    uri1 = URI(request_1.uri)
    uri2 = URI(request_2.uri)

    q1 = URI.decode_www_form(uri1.query || "").reject { |k, _| k == "timestamp" }
    q2 = URI.decode_www_form(uri2.query || "").reject { |k, _| k == "timestamp" }

    uri1.path == uri2.path && q1.sort == q2.sort
  end

  # Use our custom matcher along with default method matcher
  c.default_cassette_options = {
    match_requests_on: [:method, :uri_without_timestamp]
  }

  # Scrub authentication tokens before recording
  c.before_record do |interaction|
    if interaction.request.headers['Authorization']
      interaction.request.headers['Authorization'] = ['REDACTED_TOKEN']
    end
  end

  # Restore or transform data before playback if needed
  c.before_playback do |interaction|
    # e.g. re-inject a fresh token placeholder
    interaction.request.headers['Authorization'] = ['LIVE_TOKEN']
  end
end
```

This setup ensures dynamic query params and sensitive headers won't break your tests, while still simulating real API behavior.