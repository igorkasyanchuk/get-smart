## 🕵️ Advanced Model Versioning with PaperTrail
Use the PaperTrail gem to capture every change to your ActiveRecord models, enrich version metadata, and perform time-travel queries. This is ideal for audit logs, rollback features, or data comparisons across releases.

```ruby
# Gemfile
gem 'paper_trail', '~> 12.0'
```

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_paper_trail on: [:create, :update, :destroy],
                  ignore: [:last_sign_in_at],
                  meta: { changed_by: :current_user_id }

  private

  def current_user_id
    PaperTrail.request.whodunnit
  end
end
```

```ruby
# config/initializers/paper_trail.rb
PaperTrail.configure do |config|
  config.track_associations = true
end
```

Retrieve and restore past states:

```ruby
user = User.find(42)
# List all versions
user.versions.each do |version|
  puts "Version #{version.index} at #{version.created_at}: event=#{version.event}, by=#{version.whodunnit}"
end

# Time-travel reification
past_user = user.versions.as_of(1.day.ago).reify
puts past_user.attributes
```

This setup gives you full auditability, custom metadata for tracing actors, and on‑the‑fly rollbacks or diffs between any two points in time.