## 🚀 Offload Heavy Image Processing to Background Jobs

Generating large variants synchronously can block web requests. Use ActiveJob (e.g. Sidekiq) to process in the background and cache the result for fast delivery:

```ruby
# app/models/photo.rb
class Photo < ApplicationRecord
  has_one_attached :image
  after_commit :process_image_async, on: :create

  private

  def process_image_async
    ImageProcessingJob.perform_later(id)
  end
end

# app/jobs/image_processing_job.rb
class ImageProcessingJob < ApplicationJob
  queue_as :default

  def perform(photo_id)
    photo = Photo.find(photo_id)
    # This will generate and cache the variant
    photo.image.variant(resize_to_limit: [1000, 1000], auto_orient: true).processed
  end
end
```

In your views, the first user to hit the variant URL triggers processing; subsequent requests serve the cached file instantly.  