## 🏷️ Enrich Exceptions with Context Metadata

For complex domains, embed contextual data (user IDs, request IDs, payload snapshots) directly into your exception classes. This pattern minimizes external lookups and makes logs self-descriptive.

```ruby
class ApiFailureError < StandardError
  attr_reader :endpoint, :status, :payload

  def initialize(msg = nil, endpoint:, status:, payload:)
    super(msg || "API call failed")
    @endpoint = endpoint
    @status   = status
    @payload  = payload
  end

  def to_h
    { message: message, endpoint: endpoint, status: status, payload: payload }
  end
end

# Usage
begin
  response = HTTP.post(url)
  raise ApiFailureError.new(
    endpoint: url,
    status: response.code,
    payload: response.body.to_json
  ) unless response.status.success?
rescue ApiFailureError => e
  logger.error(e.to_h)
end
```