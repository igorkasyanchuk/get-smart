## 🔍 Custom Request Matching Rules

By default, VCR matches on method and URI, but complex APIs often require more control. You can supply `match_requests_on` with custom matcher lambdas to ignore timestamp query params, sort arrays in JSON payloads, or compare only relevant headers. This ensures cassette reuse across dynamic test runs.

```ruby
VCR.configure do |c|
  c.register_request_matcher :ignore_timestamp do |request_1, request_2|
    uri1 = URI(request_1.uri)
    uri2 = URI(request_2.uri)

    params1 = URI.decode_www_form(uri1.query || '').to_h.except('timestamp')
    params2 = URI.decode_www_form(uri2.query || '').to_h.except('timestamp')

    uri1.path == uri2.path && params1 == params2
  end

  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock

  # Use the custom matcher alongside default ones
  c.default_cassette_options = {
    match_requests_on: [:method, :ignore_timestamp, :body]
  }
end
```