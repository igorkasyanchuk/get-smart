## ⚡ Asynchronous Variant Generation & Caching Strategy

Pre-generate heavy image variants in background jobs and serve them from cache to avoid on‑the‑fly CPU spikes. Use Sidekiq (or your preferred queue) to call `.processed` and store the result in Redis or CDN.

1. Enqueue variant processing after attach:

```ruby
# app/models/photo.rb
class Photo < ApplicationRecord
  has_one_attached :image
  after_commit :enqueue_variants, on: :create

  VARIANTS = {
    thumb: { resize_to_limit: [150, 150] },
    preview: { resize_to_limit: [800, 600] }
  }

  def enqueue_variants
    VARIANTS.each_key do |name|
      ProcessVariantJob.perform_async(id, name)
    end
  end
end
```

2. Background job to process & cache:

```ruby
# app/jobs/process_variant_job.rb
class ProcessVariantJob
  include Sidekiq::Worker
  def perform(photo_id, variant_key)
    photo = Photo.find(photo_id)
    v = photo.image.variant(Photo::VARIANTS[variant_key]).processed
    Rails.cache.write("photo_#{photo_id}_#{variant_key}", v.key, expires_in: 12.hours)
  end
end
```

3. Serve cached variant in your controller:

```ruby
def show
  key = Rails.cache.read("photo_#{params[:id]}_#{params[:variant]}")
  redirect_to rails_blob_url(key, disposition: 'inline')
end
```