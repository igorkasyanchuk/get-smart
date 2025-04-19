## ⚙️ Bulk Reverse Geocoding in Background with Sidekiq and Caching
For large datasets, perform reverse geocoding asynchronously and cache results to limit API calls. Combine Sidekiq for background processing with Rails cache or Redis to store already‐looked‐up coordinates.

```ruby
# app/workers/reverse_geocode_worker.rb
class ReverseGeocodeWorker
  include Sidekiq::Worker
  sidekiq_options queue: :geocoding, retry: 3

  def perform(record_class, record_id)
    record = record_class.constantize.find(record_id)
    cache_key = "geocode:#{record.latitude},#{record.longitude}"

    location = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      Geocoder.search([record.latitude, record.longitude]).first&.address
    end

    record.update_column(:address, location) if location
  end
end

# Enqueue example for a batch
User.where(address: nil).find_each do |user|
  ReverseGeocodeWorker.perform_async('User', user.id)
end
```