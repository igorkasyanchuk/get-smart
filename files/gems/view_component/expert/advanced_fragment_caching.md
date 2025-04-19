## ⚡ Advanced Fragment Caching with Varying Context
Leverage ViewComponent’s built‑in caching to drastically reduce render times by scoping caches to locale, current_user, or feature flags. Wrap expensive partials in a `cache` block inside `#call` with custom cache keys and `version:` to bust caches on deploy.

```ruby
# app/components/user_profile_component.rb
class UserProfileComponent < ViewComponent::Base
  def initialize(user:, feature_flag: false)
    @user = user
    @feature_flag = feature_flag
  end

  def call
    cache(cache_key, version: cache_version) do
      content_tag :div, class: "user-profile" do
        render_user_details
      end
    end
  end

  private

  def cache_key
    [@user.cache_key_with_version, I18n.locale, @feature_flag]
  end

  def cache_version
    Rails.application.config.x.profile_version
  end
end
```